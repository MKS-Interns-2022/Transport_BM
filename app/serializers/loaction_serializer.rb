class LocationSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :location_type, :description, :ancestry
end
