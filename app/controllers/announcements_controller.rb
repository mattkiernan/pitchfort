class AnnouncementsController < ApplicationController
  def index
    @announcements = client_announcements || current_user.announcements
  end

  def new
    @announcement = Announcement.new
    @user = current_user
  end

  def create
    @announcement = Announcement.new(announcement_params)
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
    if params[:client_id].nil?
      return false
    else
      client = Client.find(params[:client_id])
      client.announcements
    end
  end

  def load_client_from_url
    Client.find(params[:client_id])
  end

  def announcement_params
    params.require(:announcement).permit(:name, :description, :datetime, :client_id).merge(user_id: current_user.id)
  end

  def load_announcement_from_url
    Announcement.find(params[:id])
  end
end
