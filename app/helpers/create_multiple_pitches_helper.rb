module CreateMultiplePitchesHelper
  def create_multiple_pitches(parsed_params)
    @journalist_ids.each do |id|
      Pitch.create(
        announcement: @announcement,
        subject: @subject,
        body: @body,
        journalist_id: id
      )
    end
  end

  def parsed_params
    @subject = params[:subject]
    @body = params[:body]
    @journalist_ids = params[:journalists]["journalist_ids"].reject!(&:blank?)
    @announcement = load_announcement_from_url
  end
end
