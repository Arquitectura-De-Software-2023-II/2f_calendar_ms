class Api::V1::CrudController < ApplicationController
  def index
    event = Event.all
    render json: event, status:200
  end

  def create
    event = Event.new(
      cod: event_params[:cod],
      title: event_params[:title],
      description: event_params[:description],
      begin: event_params[:begin],
      end: event_params[:end],
      client_ID: event_params[:client_ID],
      creator_ID: event_params[:creator_ID],
      event_type: event_params[:event_type],
      editable: event_params[:editable])
    if event.save
      render json: event, status: 200
    else
      render json:  { error: 'No se pudo crear el evento' }
    end
  end

  def read
  end

  def update
  end

  def destroy
  end

  private
  
    def event_params
      params.require(:event).permit(:cod, :title, :description, :begin, :end, :client_ID, :creator_ID, :event_type, :editable)
    end
end
