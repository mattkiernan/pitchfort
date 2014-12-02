class JournalistsController < ApplicationController
  def index
    @journalists = current_user.journalists
    @journalist = Journalist.new
    @selected_journalists = load_journalist_topics
    respond_to do |format|
      format.json { render json: @selected_journalists }
      format.html
    end
  end

  def create
    @journalist = Journalist.new(journalist_params)
    if @journalist.save
      redirect_to journalists_path
    end
  end

  def show
    @journalist = load_journalist_from_url
  end

  private

  def load_journalist_from_url
    Journalist.find(params[:id])
  end

  def journalist_params
    params.require(:journalist).
      permit(
        :first_name,
        :last_name,
        :email,
        :phone,
        topic_ids: [],
        publication_ids: []
    )
  end

  def load_journalist_topics
    topic_ids = params[:topic_ids]
    Journalist.joins(:coverage_topics).
      where(coverage_topics: { topic_id: topic_ids }).uniq
  end
end
