class DashboardsController < ApplicationController
  def show
    @pitches = Pitch.order("updated_at").last(5)
    @announcements = Announcement.order("datetime").last(5)
    @journalists = Journalist.all
  end
end
