class ClientsController < ApplicationController
  def index
    @clients = load_clients
    @client = current_user.clients.new
  end

  def new
    @client = current_user.clients.new
  end

  def create
    @client = current_user.clients.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      render :new
    end
  end

  def show
    @client = load_client_from_url
  end

  private

  def load_clients
    current_user.clients.where("id" != nil)
  end

  def client_params
    params.require(:client).permit(:name)
  end

  def load_client_from_url
    Client.find(params[:id])
  end
end
