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

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:code, :name, :location_type, :description, :ancestry)
    end

end
