class TransporterSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :address, :contact_phone
end
