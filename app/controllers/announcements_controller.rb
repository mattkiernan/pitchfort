class AnnouncementsController < ApplicationController
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

  private

  def load_client_from_url
    Client.find(params[:client_id])
  end

  def announcement_params
    params.require(:announcement).permit(:name, :description, :datetime)
  end
end
