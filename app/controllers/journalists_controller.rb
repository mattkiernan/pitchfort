class JournalistsController < ApplicationController
  def index
    @journalists = Journalist.all
    @journalist = Journalist.new
  end

  def create
    @journalist = Journalist.new(journalist_params)
    if @journalist.save
      redirect_to @journalist
    else
      render :new
    end
  end

  def show
    @journalist = load_journalist_from_url
  end

  private

  def journalist_params
    params.require(:journalist).permit(:first_name, :last_name, :email, :phone)
  end

  def load_journalist_from_url
    Journalist.find(params[:id])
  end
end
