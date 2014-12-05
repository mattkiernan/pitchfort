class BatchPitchesController < ApplicationController
  def new
    @pitch = Pitch.new
    @pitch_topic = PitchTopic.new
    @announcement = load_announcement
    @announcement_list = load_client_announcements || current_user.announcements
  end

  def create
    pitch_creator = PitchCreator.new(
      load_journalists,
      load_topics,
      pitch_params,
      current_user,
    )
    pitch_creator.create_pitches

    if pitch_creator.successful?
      redirect_to root_path
    else
      flash[:error] = pitch_creator.error_message
      redirect_to root_path
    end
  end

  private

  def load_pitch
    params[:pitch]
  end

  def load_journalists
    load_pitch[:journalist_id]
  end

  def load_topics
    params[:pitch][:pitch_topic][:topic_id].reject!(&:blank?)
  end

  def load_topics
    load_pitch[:pitch_topic][:topic_id].reject!(&:blank?)
  end

  def load_announcement
    if params[:announcement_id].present?
      Announcement.find(params[:announcement_id])
    end
  end

  def load_client
    params[:cliend_id]
  end

  def load_client_announcements
    if load_client.present?
      Announcement.where(client_id: params[:client_id])
    end
  end

  def pitch_params
    params.require(:pitch).permit(:body, :subject, :title, :announcement_id)
  end
end
