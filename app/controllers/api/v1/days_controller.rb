class Api::V1::DaysController < ApplicationController
  def index
    day = Day.all
    render json: day, status:200
  end

  def show
    day = Day.find_by(id: params[:id])
    if day
      render json: day, status: 200
    else
      render json: { error: 'No se encontró el elemento' }
    end
  end

  def update
    day = Day.find(params[:id])
    if day
      day.update(
        cod: day_params[:cod],
        name: day_params[:name],
        available: day_params[:available]
      )
      render json: "Datos del día actualizados", status: 200
    else
      render json: { error: 'No se pudo actualizar la información del día' }
    end
  end

  def create
    day = Day.new(
      cod: day_params[:cod],
      name: day_params[:name],
      available: day_params[:available])
    if day.save
      render json: day, status: 200
    else
      render json:  { error: 'No se pudo crear el elemento del día' }
    end
  end

  def destroy
    day = Day.find(params[:id])
    if day
      day.destroy
      render json: "Día eliminado", status: 200
    else
      render json: { error: 'Ese elemento de día no existe o ya fue eliminado' }
    end
  end

  private
  def day_params
    params.require(:day).permit(:cod, :name, :available)
  end
end
