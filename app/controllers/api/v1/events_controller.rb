class Api::V1::EventsController < ApplicationController
  def index
    event = Event.all
    render json: event, status:200
  end

  def show
    event = Event.find_by(cod: params[:id])
    if event
      render json: event, status: 200
    else
      render json: { error: 'No se encontró el evento buscado' }
    end
  end
  def create
    request_data = JSON.parse(params['_json'])
  
    pet = Pet.find_by(pet_id: request_data['pet_id'])
    creator = Client.find_by(user_id: request_data['creator_ID'])
    if creator 
      puts '🧧'
      if pet
        puts '🎃'
        event = Event.new(
          # cod: event_params[:cod],
          # title: event_params[:title],
          # description: event_params[:description],
          # begin: event_params[:begin],
          # end: event_params[:end],
          # pet_id: event_params[:pet_id],
          # creator_ID: event_params[:creator_ID],
          # event_type: event_params[:event_type],
          # editable: event_params[:editable])
          cod: request_data['cod'],
          title: request_data['title'],
          description: request_data['description'],
          begin: request_data['begin'],
          end: request_data['end'],
          pet_id: request_data['pet_id'],
          creator_ID: request_data['creator_ID'],
          event_type: request_data['event_type'],
          editable: request_data['editable'],
          day_id: request_data['day_id'])
        if event.save
          render json: { message: "Nuevo evento creado correctamente"}, status: 200
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
    request_data = JSON.parse(params['_json'])

    event = Event.find_by(cod: params[:id])
    
    if event
      puts '🧨'
      event.update(
      # cod: event_params[:cod],
      # title: event_params[:title],
      # description: event_params[:description],
      # begin: event_params[:begin],
      # end: event_params[:end],
      # pet_id: event_params[:pet_id],
      # creator_ID: event_params[:creator_ID],
      # event_type: event_params[:event_type],
      # editable: event_params[:editable])
      cod: request_data['cod'],
      title: request_data['title'],
      description: request_data['description'],
      begin: request_data['begin'],
      end: request_data['end'],
      pet_id: request_data['pet_id'],
      creator_ID: request_data['creator_ID'],
      event_type: request_data['event_type'],
      editable: request_data['editable'],
      day_id: request_data['day_id'])
      render json: { message: "Datos del evento actualizados"} , status: 200
    else
      puts '🎇'
      render json: { error: 'No se pudo actualizar la información del evento' }
    end
  end

  def destroy
    
    event = Event.find_by(cod: params[:id])
    if event
      event.destroy
      render json: { message: "Evento eliminado correctamente"} , status: 200
    else
      render json: { error: 'Ese evento no existe o ya fue eliminado' }
    end
  end

  private
  def event_params
    params.require(:event).permit(:cod, :title, :description, :begin, :end, :pet_id, :creator_ID, :event_type, :editable)
  end
end
