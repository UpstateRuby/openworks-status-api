class ThingsController < ApplicationController
  def index
    location = Location.find(params[:location_id])
    things = location.things

    render json: things
  end

  def show
    thing = Thing.find(params[:id])
    render json: thing
  end
end
