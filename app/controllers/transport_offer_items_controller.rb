class TransportOfferItemsController < ApplicationController
    before_action :set_transport_offer_item, only: %i[show update destroy]

    def index
        transport_offer_items = TransportOfferItem.all
        data = serialize(transport_offer_items)
        render json: {success: true, data:data}
    end

    def show
        data = serialize(@transport_offer_item)
        render json: {success: true, data:data}
    end

    def create
        @transport_offer_item = TransportOfferItem.new(transport_offer_item_params)
        
        if @transport_offer_item.save
            data = serialize(@transport_offer_item)
            render json: {success: true, data: data}, status: :created
        else 
            error = @transport_offer_item.errors.full_messages[0]
            render json: {success: false, error: error}, status: :unprocessable_entity
        end
    end

    def update

        if @transport_offer_item.update(transport_offer_item_params)
            data = serialize(@transport_offer_item)
            render json: {success: true, data: data}, status: :ok
        else 
            error = @transport_offer_item.errors.full_messages[0]
            render json: {success: false, error: error}, status: :unprocessable_entity
        end
    end

    private

    def serialize(data)
        ActiveModelSerializers::SerializableResource.new(data)
    end
  
    def set_transport_offer_item
      @transport_offer_item = TransportOfferItem.find(params[:id])
    end
  
    def transport_offer_item_params
      params.require(:transport_offer_item).permit(:transport_offer_id, :transport_bid_item_id, :price, :winner, :rank)
    end
end
