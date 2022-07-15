class TransportPlan < ApplicationRecord
  belongs_to :region, class_name: 'Location'
end
