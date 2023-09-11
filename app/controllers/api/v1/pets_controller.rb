class Api::V1::PetsController < ApplicationController
  def index
    pet = Pet.all
    render json: pet, status:200
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
