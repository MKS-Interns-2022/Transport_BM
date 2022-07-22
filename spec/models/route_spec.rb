require 'rails_helper'

RSpec.describe Route, type: :model do
  subject { create(:route) }

  it{is_expected.to(validate_presence_of(:name))}
  it{is_expected.to(belong_to(:region))}
  it{is_expected.to(belong_to(:source))}
  it{is_expected.to(belong_to(:destination))}

  it 'validates that source and destination are different' do
    adama = create(:location)
    yeka = build(:route, source: adama, destination: adama )
    expect(yeka).not_to(be_valid)
    expect(yeka.errors.full_messages[0]).to eq "Source and Destination cannot be the same."
  end
end
