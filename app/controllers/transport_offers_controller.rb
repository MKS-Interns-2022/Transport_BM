class TransportOffersController < ApplicationController
    before_action :set_transport_offer, only: %i[show update destroy]

    def index
        transport_offers = TransportOffer.all
        data = serialize(transport_offers)
        render json: {success: true, data:data}
    end

    def show
        data = serialize(@transport_offer)
        render json: {success: true, data:data}
    end

    def create
        @transport_offer = TransportOffer.new(transport_offer_params)
        
        if @transport_offer.save
            data = serialize(@transport_offer)
            render json: {success: true, data: data}, status: :created
        else 
            error = @transport_offer.errors.full_messages[0]
            render json: {success: false, error: error}, status: :unprocessable_entity
        end
    end

    def update

        if @transport_offer.update(transport_offer_params)
            data = serialize(@transport_offer)
            render json: {success: true, data: data}, status: :ok
        else 
            error = @transport_offer.errors.full_messages[0]
            render json: {success: false, error: error}, status: :unprocessable_entity
        end
    end

    private

    def serialize(data)
        ActiveModelSerializers::SerializableResource.new(data)
    end
  
    def set_transport_offer
      @transport_offer = TransportOffer.find(params[:id])
    end
  
    def transport_offer_params
      params.require(:transport_offer).permit(:transport_bid_id, :transporter_id, :offer_date)
    end
end
