class TransportPlansController < ApplicationController
    before_action :set_transport_plan, only: %i[show update destroy]

    def index
        @transport_plans = TransportPlan.all
        data = ActiveModelSerializers::SerializableResource.new(@transport_plans)
        render json: { success: true, data: data}
    end

    def children
        parent = Location.find(params[:id])
        render json: { success: true, data: serialize(parent.children) }
    end

    def show
        render json: @transport_plan
    end

    def create
        @transport_plan = TransportPlan.new(transport_plan_params)
        data = ActiveModelSerializers::SerializableResource.new(@transport_plan)
        if @transport_plan.save
          render json: { success: true, data: data}, status: :created
        else
          errors = ActiveModelSerializers::SerializableResource.new(@transport_plan.errors.full_messages[0])
          render json: {success: false, error: errors}, status: :unprocessable_entity
        end
      end
    
      def update
        if @transport_plan.update(transport_plan_params)
          data = ActiveModelSerializers::SerializableResource.new(@transport_plan)
          render json: {success: true, data: data}, status: :ok
        else
          errors = ActiveModelSerializers::SerializableResource.new(@transport_plan.errors.full_messages[0])
          render json: {success: false, error: errors}, status: :unprocessable_entity
        end
      end

    private
    def set_transport_plan
        @transport_plan = TransportPlan.find(params[:id])
    end

    def transport_plan_params
        params.require(:transport_plan).permit(:reference_no, :plan_type ,:region_id)
    end
end
