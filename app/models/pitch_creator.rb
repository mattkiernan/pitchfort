class PitchCreator

  def initialize(journalists, topics, pitch_params, user)
    @journalists = journalists
    @pitch_params = pitch_params
    @user = user
    @topics = topics
    @errors = []
  end

  def create_pitches
    if @journalists.nil?
      @errors << "You must select at least one topic & one journalist"
    else
      @journalists.each do |journalist_id|
        build_pitch(journalist_id)
      end
    end
  end

  def successful?
    @errors.empty?
  end

  def error_message
    if @errors.any?
      @errors.join(" and ")
    end
  end

  private

  def build_pitch(journalist_id)
    pitch = Pitch.create(@pitch_params.
                         merge(journalist_id: journalist_id, user_id: @user.id))
    if pitch.save
      create_pitch_topics(pitch)
      send_pitch_email(journalist_id)
    else
      @errors << "A pitch must have a subject and body"
    end
  end

  def create_pitch_topics(pitch)
    @topics.each do |topic|
      PitchTopic.create(pitch_id: pitch.id, topic_id: topic)
    end
  end

  def send_pitch_email(journalist_id)
    journalist = Journalist.find(journalist_id)
    subject = @pitch_params["subject"]
    body = @pitch_params["body"]
    PitchMailer.email(journalist, subject, body, @user).deliver
  end
end
