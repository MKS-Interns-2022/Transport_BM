class TransportPlanSerializer < ActiveModel::Serializer
    attributes :id, :reference_no, :plan_type, :region_id, :region_name
end