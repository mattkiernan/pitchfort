class BatchPitchesController < ApplicationController
  include CreateMultiplePitchesHelper

  def new
  end

  def create
    create_multiple_pitches(batch_pitch_params)
    redirect_to announcement_path(@announcement)
  end

  private

  def batch_pitch_params
    @subject = params[:subject]
    @body = params[:body]
    @journalist_ids = params[:journalists]["journalist_ids"].reject!(&:blank?)
    @announcement = load_announcement_from_url
  end

  def load_announcement_from_url
    Announcement.find(params[:announcement_id])
  end
end
