class JournalistsController < ApplicationController
  def index
    @journalists = Journalist.all
    @journalist = Journalist.new
    topic_ids = params[:topic_ids]
    coverage_topics = CoverageTopic.where(topic_id: topic_ids)
    @selected_journalists = Journalist.where(id: coverage_topics)
    respond_to do |format|
      format.json { render json: @selected_journalists }
      format.html {}
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

  def list_journalist_topics
    journalist_list = {}
    @journalists = Journalist.all
    @journalists.map do |journalist|
      journalist_list[journalist.id] = journalist.topic_ids
    end
    journalist_list
  end
end
