class PitchCreator
  attr_reader :errors

  def initialize(journalists, topics, pitch_params, user)
    @journalists = journalists
    @topics = topics
    @pitch_params = pitch_params
    @user = user
    @errors = []
  end

  def create_pitches
    if @journalists.nil?
      @errors << "You must select at least one topic & one journalist"
    else
      @journalists.each do |journalist_id|
        build_pitch(journalist_id)
        send_pitch_email(journalist_id)
      end
    end
  end

  def successful?
    @errors.empty?
  end

  private

  def build_pitch(journalist_id)
    pitch = Pitch.create(@pitch_params.
            merge(journalist_id: journalist_id, user_id: @user.id))
    create_pitch_topics(pitch)
  end

  def create_pitch_topics(pitch)
    if pitch.id.nil?
      @errors << "A pitch must have a subject & body"
    else
      @topics.each do |topic|
        PitchTopic.create(pitch_id: pitch.id, topic_id: topic)
      end
    end
  end

  def journalist_email(journalist_id)
    Journalist.find(journalist_id).email
  end

  def send_pitch_email(journalist_id)
    journalist = Journalist.find(journalist_id)
    subject = @pitch_params["subject"]
    body = @pitch_params["body"]
    PitchMailer.email(journalist, subject, body, @user).deliver
  end
end
