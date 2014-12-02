class AnnouncementsController < ApplicationController
  def index
    @announcements = client_announcements || current_user.announcements
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = current_user.announcements.new(announcement_params)
    if @announcement.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @announcement = load_announcement_from_url
    @pitches = @announcement.pitches.order("created_at DESC")
  end

  private

  def client_announcements
    if params[:client_id].present?
      Client.find(params[:client_id]).announcements
    end
  end

  def load_client_from_url
    Client.find(params[:client_id])
  end

  def announcement_params
    params.require(:announcement).
      permit(
        :name,
        :description,
        :datetime,
        :client_id
    )
  end

  def load_announcement_from_url
    Announcement.find(params[:id])
  end
end
