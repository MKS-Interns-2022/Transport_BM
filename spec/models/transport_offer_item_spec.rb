require 'rails_helper'

RSpec.describe TransportOfferItem, type: :model do
  
  it 'has a valid factory' do
    expect(create(:transport_offer)).to be_valid
  end

  it{is_expected.to belong_to(:transport_offer)}
  it{is_expected.to belong_to(:transport_bid_item)}
  it{is_expected.to validate_presence_of(:price)}
  it{is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0)}
  it{is_expected.to validate_numericality_of(:rank).is_greater_than_or_equal_to(0)}
  
end
