class AnnouncementsController < ApplicationController
  def index
    @client = load_client_from_url
    @announcements = @client.announcements
  end

  def new
    @client = load_client_from_url
    @announcement = @client.announcements.new
  end

  def create
    @client = load_client_from_url
    @announcement = @client.announcements.new(announcement_params)
    if @announcement.save
      redirect_to @client
    else
      render :new
    end
  end

  def show
    @announcement = load_announcement_from_url
    @pitches = @announcement.pitches.order("created_at DESC")
  end

  private

  def load_client_from_url
    Client.find(params[:client_id])
  end

  def announcement_params
    params.require(:announcement).permit(:name, :description, :datetime)
  end

  def load_announcement_from_url
    Announcement.find(params[:id])
  end
end
