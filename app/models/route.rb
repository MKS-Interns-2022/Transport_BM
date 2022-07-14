class Route < ApplicationRecord
  belongs_to :region, class_name: 'Location'
  belongs_to :source, class_name: 'Location'
  belongs_to :destination, class_name: 'Location'
end
