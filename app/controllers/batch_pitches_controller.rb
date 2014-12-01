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
    pitch_creator = PitchCreator.new(
      announcement,
      journalists,
      topics,
      pitch_params,
      current_user
    )
    pitch_creator.create_pitches

    if pitch_creator.successful?
      redirect_to client_announcement_path(announcement.client, announcement)
    else
      flash[:error] = pitch_creator.errors.join(" and ")
      @pitch = Pitch.new
      @pitch_topic = PitchTopic.new
      render :new
    end
  end

  def load_announcement_from_url
    Announcement.find(params[:announcement_id])
  end

  def pitch_params
    params.require(:pitch).permit(:body, :subject, :title)
  end
end
