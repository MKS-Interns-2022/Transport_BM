class TransportPlanItemSerializer < ActiveModel::Serializer
    attributes :id, :quantity, :planned
    has_one :route
    has_one :transport_plan
    has_one :unit
end