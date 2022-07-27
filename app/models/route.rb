class Route < ApplicationRecord
  belongs_to :region, class_name: 'Location'
  belongs_to :source, class_name: 'Location'
  belongs_to :destination, class_name: 'Location'
  
  validates :name, presence: true

  validate :validates_proper_routing

  delegate(:name, to: :region, prefix: true)
  delegate(:name, to: :source, prefix: true)
  delegate(:name, to: :destination, prefix: true)

  def validates_proper_routing
    return if source != destination
    errors.add(:base, "Source and Destination cannot be the same.") if source == destination
  end
end
