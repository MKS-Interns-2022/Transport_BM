class RoutesController < ApplicationController
  before_action :set_route, only: %i[ show update ]

  def index
    @routes = Route.all
    data = ActiveModelSerializers::SerializableResource.new(@routes)
    render json: { success: true, data: data }
  end

  def show
    data = ActiveModelSerializers::SerializableResource.new(@route)
    render json: { success: true, data: data }
  end

  def create
    @route = Route.new(route_params)
    data = ActiveModelSerializers::SerializableResource.new(@route)
    if @route.save
      render json: { success: true, data: data}, status: :created
    else
      errors = ActiveModelSerializers::SerializableResource.new(@route.errors.full_messages[0])
      render json: {success: false, error: errors}, status: :unprocessable_entity
    end
  end

  def update
    if @route.update(route_params)
      data = ActiveModelSerializers::SerializableResource.new(@route)
      render json: {success: true, data: data}, status: :ok
    else
      errors = ActiveModelSerializers::SerializableResource.new(@route.errors.full_messages[0])
      render json: {success: false, error: errors}, status: :unprocessable_entity
    end
  end

  # DELETE /routes/1
  # def destroy
  #   @route.destroy
  # end

  private
    def set_route
      @route = Route.find(params[:id])
    end

    def route_params
      params.require(:route).permit(:name, :region_id, :source_id, :destination_id )
    end
end