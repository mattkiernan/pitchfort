class PitchCreator
  attr_reader :errors

  def initialize(announcement, journalists, topics, pitch_params)
    @announcement = announcement
    @journalists = journalists
    @topics = topics
    @pitch_params = pitch_params
    @errors = []
  end

  def create_pitches
    if @journalists.nil?
      @errors << "You must select at least one topic & one journalist"
    else
      @journalists.each do |journalist_id|
        pitch = @announcement.pitches.create(@pitch_params.
          merge(journalist_id: journalist_id))
        create_pitch_topics(pitch)
      end
    end
  end

  def successful?
    @errors.empty?
  end

  private

  def create_pitch_topics(pitch)
    if pitch.id.nil?
      @errors << "A pitch must have a subject & body"
    else
      @topics.each do |topic|
        PitchTopic.create(pitch_id: pitch.id, topic_id: topic)
      end
    end
  end
end
