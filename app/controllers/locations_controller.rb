class LocationsController < ApplicationController
  before_action :set_location, only: %i[show update destroy]

  def index
    @locations = Location.all
    data = ActiveModelSerializers::SerializableResource.new(@locations)
    render json: { success: true, data: data}
  end

  def children
    parent = Location.find(params[:id])
    render json: { success: true, data: serialize(parent.children) }
  end

  def show
    render json: @location
  end

  def create
    @location = Location.new(location_params)
    data = ActiveModelSerializers::SerializableResource.new(@location)
    if @location.save
      render json: { success: true, data: data}, status: :created
    else
      errors = ActiveModelSerializers::SerializableResource.new(@location.errors.full_messages[0])
      render json: {success: false, error: errors}, status: :unprocessable_entity
    end
  end

  def update
    if @location.update(location_params)
      data = ActiveModelSerializers::SerializableResource.new(@location)
      render json: {success: true, data: data}, status: :ok
    else
      errors = ActiveModelSerializers::SerializableResource.new(@location.errors.full_messages[0])
      render json: {success: false, error: errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @location.destroy
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:code, :name, :location_type, :description, :ancestry)
    end

end
