class UnitOfMeasure < ApplicationRecord
    WEIGHT = 'Weight'.freeze
    VOLUME = 'Volume'.freeze
    ITEM = 'Item'.freeze

    UNIT_TYPES = [WEIGHT, VOLUME, ITEM].freeze
end
