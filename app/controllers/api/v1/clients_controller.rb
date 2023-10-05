class Api::V1::ClientsController < ApplicationController
  def index
    client = Client.all
    render json: client, status:200
  end

  def show
    client = Client.find_by(user_id: params[:id])
    if client
      render json: client, status: 200
    else
      render json: { error: 'No se encontró el usuario buscado' }
    end
  end

  def create
    request_data = JSON.parse(params['_json'])
    person = Client.find_by(user_id: request_data['user_id'])
    if !person
      client = Client.new(
        # user_id: client_params[:user_id],
        # status: client_params[:status]
        user_id: request_data['user_id'],
        status: request_data['status']
      )
      if client.save
        render json: { error: 'Usuario creado correctamente en el calendario' }, status: 200
      else
        render json:  { error: 'No se pudo crear el usuario' }
      end
    else
      render json:  { error: 'El usuario ya existe' }
    end
  end

  def update
    request_data = JSON.parse(params['_json'])
    client = Client.find_by(user_id: params[:id])
    if client
      client.update(
        # user_id: client_params[:user_id],
        # status: client_params[:status]
        user_id: request_data['user_id'],
        status: request_data['status']
      )
      render json: {error:"Datos del usuario actualizados"}, status: 200
    else
      render json:  { error: 'Usuario no encontrado' }
    end
  end


  def destroy
    client = Client.find_by(user_id: params[:id])
    if client
      client.destroy
      render json: {error:"Usuario eliminado"}, status: 200
    else
      render json: { error: 'Ese usuario no existe o ya fue eliminado' }
    end
  end

  private
  def client_params
    params.require(:client).permit(:user_id, :status)
  end

end
