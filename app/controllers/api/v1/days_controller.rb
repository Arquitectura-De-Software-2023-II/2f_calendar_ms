class Api::V1::DaysController < ApplicationController
  def index
    day = Day.all
    render json: day, status:200
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
