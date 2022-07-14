class TransportersController < ApplicationController
    before_action :set_transporter, only: %i[show update]

    def index
        transporters = Transporter.all
        render json: {success: true, data:transporters}
    end

    def show
        data = serialize(@transporter)
        render json: {success: true, data:data}
    end

    def create
        @tranporter = Transporter.new(transporter_params)

        if @tranporter.save
            render json: {success: true, data:serialize(@tranporter)}, status: :created
        else 
            error = @tranporter.errors.full_messages[0]
            render json: {success: false, error: error}, status: :unprocessable_entity
        end
    end

    def update
        # debugger
        if @transporter.update(transporter_params)
            render json: {success: true, data:serialize(@transporter)}, status: :ok
        else 
            error = @transporter.errors.full_messages[0]
            render json: {success: false, error: error}, status: :unprocessable_entity
        end
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
