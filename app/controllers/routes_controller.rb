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

    if @route.save
      render json: @route, status: :created, location: @route
    else
      render json: @route.errors, status: :unprocessable_entity
    end
  end

  def update
    if @route.update(route_params)
      render json: @route
    else
      render json: @route.errors, status: :unprocessable_entity
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