class Route < ApplicationRecord
  belongs_to :region
  belongs_to :source
  belongs_to :destination
end
