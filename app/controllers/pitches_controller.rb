class PitchesController < ApplicationController
  def index
    @pitches = announcement_pitches || client_pitches || current_user.pitches
    @client = load_client_from_url
    @announcement = load_announcement_from_url
  end

  def new
    @announcement = load_announcement_from_url
  end

  def update
    @pitch = load_pitch_from_url
    if @pitch.update(pitch_params)
      respond_to do |format|
        format.html { render html: @pitch }
        format.json { render json: @pitch }
      end
    end
  end

  private

  def load_client_from_url
    if params[:client_id].present?
      Client.find(params[:client_id])
    end
  end

  def announcement_pitches
    if params[:announcement_id].present?
      Pitch.where(announcement_id: params[:announcement_id])
    end
  end

  def client_pitches
    if params[:client_id].present?
      Client.find(params[:client_id]).pitches
    end
  end

  def load_announcement_from_url
    if params[:announcement_id].present?
      Announcement.find(params[:announcement_id])
    end
  end

  def load_pitch_from_url
    Pitch.find(params[:id])
  end

  def pitch_params
    params.require(:pitch).permit(:status)
  end
end
