class UnitOfMeasuresController < ApplicationController
    before_action :set_unit_of_measure, only: %i[show update destroy]

    def index
        @unit_of_measures = UnitOfMeasure.all
        data = ActiveModelSerializers::SerializableResource.new(@unit_of_measures)
        render json: { success: true, data: data}
    end

    def show
        render json: @unit_of_measure
    end

    def create
        @unit_of_measure = UnitOfMeasure.new(unit_of_measure_params)
        data = ActiveModelSerializers::SerializableResource.new(@unit_of_measure)
        if @unit_of_measure.save
          render json: { success: true, data: data}, status: :created
        else
          errors = ActiveModelSerializers::SerializableResource.new(@unit_of_measure.errors.full_messages[0])
          render json: {success: false, error: errors}, status: :unprocessable_entity
        end
      end
    
      def update
        if @unit_of_measure.update(unit_of_measure_params)
          data = ActiveModelSerializers::SerializableResource.new(@unit_of_measure)
          render json: {success: true, data: data}, status: :ok
        else
          errors = ActiveModelSerializers::SerializableResource.new(@unit_of_measure.errors.full_messages[0])
          render json: {success: false, error: errors}, status: :unprocessable_entity
        end
      end

    private
    def set_unit_of_measure
        @unit_of_measure = UnitOfMeasure.find(params[:id])
    end

    def unit_of_measure_params
        params.require(:unit_of_measure).permit(:name, :abreviation ,:unit_type)
    end
end
