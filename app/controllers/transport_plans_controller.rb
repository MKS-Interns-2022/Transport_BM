class TransportPlansController < ApplicationController
    before_action :set_transport_plan, only: %i[show update destroy]

    def index
        @transport_plans = TransportPlan.all
        data = ActiveModelSerializers::SerializableResource.new(@transport_plans)
        render json: { success: true, data: data}
    end

    def show
        render json: @transport_plan
    end

    def create
        @transport_plan = TransportPlan.new(transport_plan_params)

        if @transport_plan.save
            render json: @transport_plan, status: :created, location:@transport_plan
        else
            render json:@transport_plan, status: :unprocessable_entity
        end
    end

    def update
        if @transport_plan.update(transport_plan_params)
        render json: @transport_plan
        else
        render json: @transport_plan.errors, status: :unprocessable_entity
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
