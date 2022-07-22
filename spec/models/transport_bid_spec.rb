require 'rails_helper'

RSpec.describe TransportBid, type: :model do
  subject { create(:transport_bid)}

  it{is_expected.to(validate_presence_of(:reference_no))}
  it{is_expected.to(validate_uniqueness_of(:reference_no).case_insensitive)}
  it{is_expected.to(validate_presence_of(:start_date))}
  it{is_expected.to(validate_presence_of(:end_date))}
  it{is_expected.to(validate_presence_of(:opening_date))}
  it{is_expected.to(validate_presence_of(:status))}
  it{is_expected.to(validate_presence_of(:bid_bond_amount))}
  it{is_expected.to(validate_numericality_of(:bid_bond_amount).is_greater_than(0))}

  it{is_expected.to(validate_inclusion_of(:status).in_array(TransportBid::STATUSES))}

end
