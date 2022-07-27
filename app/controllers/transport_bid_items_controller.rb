class TransportBidItemsController < ApplicationController
  before_action :set_transport_bid_item, only: %i[ show update ]

  def index
    @transport_bid_items = TransportBidItem.all
    data = ActiveModelSerializers::SerializableResource.new(@transport_bid_items)
    render json: { success: true, data: data }
  end

  def show
    data = ActiveModelSerializers::SerializableResource.new(@transport_bid_item)
    render json: { success: true, data: data }
  end

  def create
    @transport_bid_item = TransportBidItem.new(transport_bid_item_params)
    data = ActiveModelSerializers::SerializableResource.new(@transport_bid_item)
    if @transport_bid_item.save
      render json: { success: true, data: data}, status: :created
    else
      errors = ActiveModelSerializers::SerializableResource.new(@transport_bid_item.errors.full_messages[0])
      render json: {success: false, error: errors}, status: :unprocessable_entity
    end
  end

  def update
    if @transport_bid_item.update(transport_bid_item_params)
      data = ActiveModelSerializers::SerializableResource.new(@transport_bid_item)
      render json: {success: true, data: data}, status: :ok
    else
      errors = ActiveModelSerializers::SerializableResource.new(@transport_bid_item.errors.full_messages[0])
      render json: {success: false, error: errors}, status: :unprocessable_entity
    end
  end

  # DELETE /transport_bid_items/1
  # def destroy
  #   @transport_bid_item.destroy
  # end

  private
    def set_transport_bid_item
      @transport_bid_item = TransportBidItem.find(params[:id])
    end

    def transport_bid_item_params
      params.require(:transport_bid_item).permit(:transport_bid_id, :transport_plan_item_id, :quantity, :unit_of_measure_id )
    end
end
