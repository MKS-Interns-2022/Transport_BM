class RouteSerializer < ActiveModel::Serializer
    attributes :id, :name, :region_id, :region_name, :source_id, :source_name, :destination_id, :destination_name
  end