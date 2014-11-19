class BatchPitchesController < ApplicationController
  def new
    @announcement = load_announcement_from_url
    @pitch = @announcement.pitches.new
  end

  def create
    @announcement = load_announcement_from_url
    @journalists = params[:pitch][:journalist_ids].reject!(&:blank?)
    @journalists.each do |id|
      @announcement.pitches.create(pitch_params.merge(journalist_id: id))
    end
    redirect_to @announcement
  end

  private

  def pitch_params
    params.require(:pitch).permit(:body, :subject, :title)
  end

  def load_announcement_from_url
    Announcement.find(params[:announcement_id])
  end
end
