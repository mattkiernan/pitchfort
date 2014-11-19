class PitchesController < ApplicationController
  def new
    @announcement = load_announcement_from_url
  end

  private

  def load_announcement_from_url
    Announcement.find(params[:announcement_id])
  end
end
