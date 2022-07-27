class TransportPlanItemsController < ApplicationController
    before_action :set_transport_plan_item, only: %i[show update destroy]

    def index
        @transport_plan_items = TransportPlanItem.all
        data = ActiveModelSerializers::SerializableResource.new(@transport_plan_items)
        render json: { success: true, data: data}
    end

    def show
        render json: @transport_plan_item
    end

    def create
        @transport_plan_item = TransportPlanItem.new(transport_plan_item_params)
        data = ActiveModelSerializers::SerializableResource.new(@transport_plan_item)
        if @transport_plan_item.save
          render json: { success: true, data: data}, status: :created
        else
          errors = ActiveModelSerializers::SerializableResource.new(@transport_plan_item.errors.full_messages[0])
          render json: {success: false, error: errors}, status: :unprocessable_entity
        end
      end
    
      def update
        if @transport_plan_item.update(transport_plan_item_params)
          data = ActiveModelSerializers::SerializableResource.new(@transport_plan_item)
          render json: {success: true, data: data}, status: :ok
        else
          errors = ActiveModelSerializers::SerializableResource.new(@transport_plan_item.errors.full_messages[0])
          render json: {success: false, error: errors}, status: :unprocessable_entity
        end
      end

    private
    def set_transport_plan_item
        @transport_plan_item = TransportPlanItem.find(params[:id])
    end

    def transport_plan_item_params
        params.require(:transport_plan_item).permit(:route_id, :transport_plan_id ,:quantity, :unit_id, :planned)
    end
end
