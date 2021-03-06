class TransportBidsController < ApplicationController
  before_action :set_transport_bid, only: %i[ show update ]

  def index
    @transport_bids = TransportBid.all
    data = ActiveModelSerializers::SerializableResource.new(@transport_bids)
    render json: { success: true, data: data }
  end

  def show
    data = ActiveModelSerializers::SerializableResource.new(@transport_bid)
    render json: { success: true, data: data }
  end

  def create
    @transport_bid = TransportBid.new(transport_bid_params)
    data = ActiveModelSerializers::SerializableResource.new(@transport_bid)
    if @transport_bid.save
      render json: { success: true, data: data}, status: :created
    else
      errors = ActiveModelSerializers::SerializableResource.new(@transport_bid.errors.full_messages[0])
      render json: {success: false, error: errors}, status: :unprocessable_entity
    end
  end

  def update
    if @transport_bid.update(transport_bid_params)
      data = ActiveModelSerializers::SerializableResource.new(@transport_bid)
      render json: {success: true, data: data}, status: :ok
    else
      errors = ActiveModelSerializers::SerializableResource.new(@transport_bid.errors.full_messages[0])
      render json: {success: false, error: errors}, status: :unprocessable_entity
    end
  end

  # DELETE /transport_bids/1
  # def destroy
  #   @transport_bid.destroy
  # end

  private
    def set_transport_bid
      @transport_bid = TransportBid.find(params[:id])
    end

    def transport_bid_params
      params.require(:transport_bid).permit(:reference_no, :description, :start_date, :end_date, :opening_date, :status, :bid_bond_amount, :transport_plan_id )
    end
end
