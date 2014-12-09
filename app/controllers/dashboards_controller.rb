class DashboardsController < ApplicationController
  def show
    @pitches = current_user.pitches.order("updated_at").last(5)
    @announcements = current_user.announcements.order("datetime").last(5)
    @journalists = current_user.journalists
  end
end
