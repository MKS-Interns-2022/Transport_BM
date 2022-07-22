class TransportPlanSerializer < ActiveModel::Serializer
    attributes :id, :reference_no, :plan_type
    has_one :region
end