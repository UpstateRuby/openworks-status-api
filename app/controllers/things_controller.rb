class ThingsController < ApplicationController
  def index
    things = Thing.all
    render json: things
  end

  def show
    thing = Thing.find(params[:id])
    render json: thing
  end
end
