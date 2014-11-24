class BatchPitchesController < ApplicationController
  def new
    @announcement = load_announcement_from_url
    @pitch = @announcement.pitches.new
    @pitch_topic = PitchTopic.new
  end

  def create
    announcement = load_announcement_from_url
    journalists = params[:pitch][:journalist_id]
    topics = params[:pitch][:pitch_topic][:topic_id].reject!(&:blank?)
    create_pitch_for_each(announcement, journalists, topics)
    redirect_to client_announcement_path(announcement.client, announcement)
  end

  private

  def create_pitch_for_each(announcement, journalists, topics)
    journalists.each do |id|
      pitch = announcement.pitches.create(pitch_params.merge(journalist_id: id))
      create_pitch_topics(pitch, topics)
    end
  end

  def create_pitch_topics(pitch, topics)
    topics.each do |topic|
      PitchTopic.create(pitch_id: pitch.id, topic_id: topic)
    end
  end

  def pitch_params
    params.require(:pitch).permit(:body, :subject, :title)
  end

  def load_announcement_from_url
    Announcement.find(params[:announcement_id])
  end
end
