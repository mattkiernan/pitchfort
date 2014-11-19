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
end