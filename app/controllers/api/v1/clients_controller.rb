class Api::V1::ClientsController < ApplicationController
  def index
    client = Client.all
    render json: client, status:200
  end

  def read
  end

  def create
  end

  def update
  end

  def destroy
  end
end
