class Api::V1::CrudController < ApplicationController
  def index
    render json:  { message: "Aquí está todo" }
  end

  def create
      render json:  { message: "Se creó algo" }
  end

  def read
    render json:  { message: "Se encontró esto" }
  end

  def update
    render json:  { message: "Se actualizó algo" }
  end

  def destroy
    render json:  { message: "Se borró algo" }
  end

end
