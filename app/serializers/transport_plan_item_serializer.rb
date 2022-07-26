class TransportPlanItemSerializer < ActiveModel::Serializer
    attributes :id, :quantity, :planned, :route_id, :route_name, :transport_plan_id, :transport_plan_reference_no, :unit_id, :unit_name
end