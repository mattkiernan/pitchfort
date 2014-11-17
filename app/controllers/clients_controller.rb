class ClientsController < ApplicationController
  def index
    @clients = current_user.clients
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

  def client_params
    params.require(:client).permit(:name)
  end
end
