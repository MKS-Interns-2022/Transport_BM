require 'rails_helper'

RSpec.describe TransportBidItem, type: :model do
  subject{ create(:transport_bid_item)}

  it{is_expected.to(belong_to(:transport_bid))}
  it{is_expected.to(belong_to(:transport_plan_item))}
  it{is_expected.to(belong_to(:unit_of_measure))}
  it{is_expected.to(validate_presence_of(:quantity))}
  it{is_expected.to(validate_numericality_of(:quantity).is_greater_than(0))}

end
