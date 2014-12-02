class PitchesController < ApplicationController
  def index
    @pitches = announcement_pitches || client_pitches || current_user.pitches
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

  def announcement_pitches
    if params[:announcement_id].nil?
      return false
    else
      announcement = Announcement.find(params[:announcement_id])
      announcement.pitches
    end
  end

  def client_pitches
    if params[:client_id].nil?
      return false
    else
      client = Client.find(params[:client_id])
      client.pitches
    end
  end

  def load_announcement_from_url
    Announcement.find(params[:announcement_id])
  end

  def load_pitch_from_url
    Pitch.find(params[:id])
  end

  def pitch_params
    params.require(:pitch).permit(:status)
  end
end
