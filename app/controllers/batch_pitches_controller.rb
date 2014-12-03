class BatchPitchesController < ApplicationController
  def new
    @pitch = Pitch.new
    @pitch_topic = PitchTopic.new
    @announcement = load_announcement
    @announcement_list = load_client_announcements || current_user.announcements
  end

  def create
    journalists = params[:pitch][:journalist_id]
    topics = params[:pitch][:pitch_topic][:topic_id].reject!(&:blank?)
    pitch_creator = PitchCreator.new(
      journalists,
      topics,
      pitch_params,
      current_user
    )
    pitch_creator.create_pitches

    if pitch_creator.successful?
      redirect_to root_path
    else
      flash[:error] = pitch_creator.errors.join(" and ")
      @pitch = Pitch.new
      @pitch_topic = PitchTopic.new
      render :new
    end
  end

  private

  def load_announcement
    if params[:announcement_id].present?
      Announcement.find(params[:announcement_id])
    end
  end

  def load_client_announcements
    if params[:client_id].present?
      Announcement.where(client_id: params[:client_id])
    end
  end

  def pitch_params
    params.require(:pitch).permit(:body, :subject, :title, :announcement_id)
  end
end
