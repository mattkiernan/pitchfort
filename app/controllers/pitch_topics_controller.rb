class PitchTopicsController < ApplicationController
  def create
    @pitch_topic = PitchTopic.new
  end
end
