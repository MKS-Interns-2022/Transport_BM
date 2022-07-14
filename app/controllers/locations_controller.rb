class LocationsController < ApplicationController
  before_action :set_location, only: %i[show update destroy]

  def index
    @locations = Location.all
    data = ActiveModelSerializers::SerializableResource.new(@locations)
    render json: { success: true, data: data}
  end

  def show
    render json: @location
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      render json: @location, status: :created, location:@location
    else
      render json:@location, status: :unprocessable_entity
    end
  end

  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:code, :name, :location_type, :description, :ancestry)
    end

end
