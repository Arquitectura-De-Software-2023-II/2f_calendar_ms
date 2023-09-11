class Api::V1::ClientsController < ApplicationController
  def index
    client = Client.all
    render json: client, status:200
  end

  def show
    client = Client.find_by(id: params[:id])
    if client
      render json: client, status: 200
    else
      render json: { error: 'No se encontró el usuario buscado' }
    end
  end

  def create
    client = Client.new(
      user_id: client_params[:user_id],
      status: client_params[:status]
    )
    if client.save
      render json: client, status: 200
    else
      render json:  { error: 'No se pudo crear el usuario' }
    end
  end

  def update
    client = Client.find(params[:id])
    if client
      client.update(
        user_id: client_params[:user_id],
        status: client_params[:status]
      )
      render json: "Datos del usuario actualizados", status: 200
    else
      render json:  { error: 'No se pudo actualizar el usuario' }
    end
  end


  def destroy
    client = Client.find(params[:id])
    if client
      client.destroy
      render json: "Usuario eliminado", status: 200
    else
      render json: { error: 'Ese usuario no existe o ya fue eliminado' }
    end
  end

  private
  def client_params
    params.require(:client).permit(:user_id, :status)
  end

end
