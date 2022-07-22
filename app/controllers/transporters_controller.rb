class TransportersController < ApplicationController
    before_action :set_transporter, only: %i[show update destroy]

    def index
        transporters = Transporter.all
        data = serialize(transporters)
        render json: {success: true, data:data}
    end

    def show
        data = serialize(@transporter)
        render json: {success: true, data:data}
    end

    def create
        @transporter = Transporter.new(transporter_params)
        
        if @transporter.save
            data = serialize(@transporter)
            render json: {success: true, data: data}, status: :created
        else 
            error = @transporter.errors.full_messages[0]
            render json: {success: false, error: error}, status: :unprocessable_entity
        end
    end

    def update
        
        if @transporter.update(transporter_params)
            data = serialize(@transporter)
            render json: {success: true, data: data}, status: :ok
        else 
            error = @transporter.errors.full_messages[0]
            render json: {success: false, error: error}, status: :unprocessable_entity
        end
    end

    def destroy
        @transporter.destroy
        render json: {success: true, data: serialize(@transporter)}
    end

    private

    def serialize(data)
        ActiveModelSerializers::SerializableResource.new(data)
    end
  
    def set_transporter
      @transporter = Transporter.find(params[:id])
    end
  
    def transporter_params
      params.require(:transporter).permit(:code, :name, :address, :contact_phone)
    end
end
