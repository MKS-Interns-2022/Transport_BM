class UnitOfMeasure < ApplicationRecord
    WEIGHT = 'Weight'.freeze
    VOLUME = 'Volume'.freeze
    ITEM = 'Item'.freeze

    UNIT_TYPES = [WEIGHT, VOLUME, ITEM].freeze

    validates :name, :abreviation, :unit_type, presence: true
    validates :unit_type, inclusion: {in: UNIT_TYPES}
end
