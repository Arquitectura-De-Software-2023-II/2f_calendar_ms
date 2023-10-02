class Api::V1::EventsController < ApplicationController
  def index
    event = Event.all
    render json: event, status:200
  end

  def show
    event = Event.find_by(id: params[:id])
    if event
      render json: event, status: 200
    else
      render json: { error: 'No se encontró el evento buscado' }
    end
  end
  def create
    pet = Pet.find_by(pet_id: params[:pet_id])
    creator = Client.find_by(user_id: params[:creator_ID])
    if creator 
      if pet
        event = Event.new(
          cod: event_params[:cod],
          title: event_params[:title],
          description: event_params[:description],
          begin: event_params[:begin],
          end: event_params[:end],
          pet_id: event_params[:pet_id],
          creator_ID: event_params[:creator_ID],
          event_type: event_params[:event_type],
          editable: event_params[:editable])
        if event.save
          render json: "Nuevo evento creado correctamente", status: 200
        else
          render json:  { error: 'No se pudo crear el evento' }
        end
      else
        render json: { error: 'No se encontró la mascota con el pet_id proporcionado' }
      end
    else
      render json: { error: 'El usuario que crea el evento no está registrado en la base de datos del calendar' }
    end
  end

  def update
    event = Event.find(params[:id])
    if event
      event.update(
      cod: event_params[:cod],
      title: event_params[:title],
      description: event_params[:description],
      begin: event_params[:begin],
      end: event_params[:end],
      client_ID: event_params[:client_ID],
      creator_ID: event_params[:creator_ID],
      event_type: event_params[:event_type],
      editable: event_params[:editable])
      render json: "Datos del evento actualizados", status: 200
    else
      render json: { error: 'No se pudo actualizar la información del evento' }
    end
  end

  def destroy
    event = Event.find(params[:id])
    if event
      event.destroy
      render json: "Evento eliminado correctamente", status: 200
    else
      render json: { error: 'Ese evento no existe o ya fue eliminado' }
    end
  end

  private
  def event_params
    params.require(:event).permit(:cod, :title, :description, :begin, :end, :client_ID, :creator_ID, :event_type, :editable)
  end
end
