class RouteSerializer < ActiveModel::Serializer
    attributes :id, :name
    has_one :region
    has_one :source
    has_one :destination
  end