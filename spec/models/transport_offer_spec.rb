require 'rails_helper'

RSpec.describe TransportOffer, type: :model do

  # test factorybot
  it 'has a valid factory' do
    expect(create(:transport_offer)).to be_valid
  end

  it{is_expected.to belong_to(:transport_bid)}
  it{is_expected.to belong_to(:transporter)}
  it{is_expected.to validate_presence_of(:offer_date)}

end
