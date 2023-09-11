class Api::V1::PetsController < ApplicationController
  def index
    pet = Pet.all
    render json: pet, status:200
  end
  def read
    pet = Pet.find(params[:id])
    if pet
      render json: pet, status: 200
    else
      render json: { error: 'No se encontró el registro de la mascota' }
    end
  end

  def create
  end

  def update
  end

  def destroy
  end
end
