class PitchCreator
  def initialize(journalists, pitch_params, user)
    @journalists = journalists
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

  def error_message
    if @errors.any?
      @errors.join(" and ")
    end
  end

  private

  def build_pitch(journalist_id)
    pitch = Pitch.new(@pitch_params.
                  merge(journalist_id: journalist_id, user_id: @user.id))
    if ! pitch.save
      @errors << "A pitch must have a subject & body"
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
