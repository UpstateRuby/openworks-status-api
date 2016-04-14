class PropertiesController < ApplicationController
  def index
    properties = Property.all
    render json: properties
  end

  def show
    property = Property.find(params[:id])
    render json: property
  end
end
