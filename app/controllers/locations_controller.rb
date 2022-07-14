class LocationsController < ApplicationController

  def index
    @locations = Location.all
    data = ActiveModelSerializers::SerializableResource.new(@locations)
    render json: { success: true, data: data}
  end
end
