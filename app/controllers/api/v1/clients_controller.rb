class Api::V1::ClientsController < ApplicationController
  def index
    client = Client.all
    render json: client, status:200
  end

  def read
    client = Client.find(params[:id])
    if client
      render json: client, status: 200
    else
      render json: { error: 'No se encontró el cliente buscado' }
    end
  end

  def create
  end

  def update
  end

  def destroy
  end
end
