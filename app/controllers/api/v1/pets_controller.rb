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
    pet = Pet.new(
      pet_id: pet_params[:pet_id],
      name: pet_params[:name],
      breed: pet_params[:breed]
    )
    if pet.save
      render json: pet, status: 200
    else
      render json:  { error: 'No se pudo crear el registro de la mascota' }
    end
  end

  def update
    pet = Pet.find(params[:id])
      if pet.update(
        pet_id: pet_params[:pet_id],
        name: pet_params[:name],
        breed: pet_params[:breed])
      render json: pet, status: 200
      else
        render json: { error: 'No se pudo actualizar el registro de la mascota' }
      end
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    if pet
      pet.destroy
      render json: { message: 'Registro eliminado correctamente' }, status: 200
    else
      render json: { error: 'Ese registro de mascota no existe o ya fue eliminado' }
    end
  end

  private
  
    def pet_params
      params.require(:pet).permit(:pet_id, :name, :breed)
    end
end
