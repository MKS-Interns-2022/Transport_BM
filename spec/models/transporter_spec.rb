require 'rails_helper'

RSpec.describe Transporter, type: :model do
  subject { create(:transporter) }

  it { is_expected.to(validate_presence_of(:code)) }
  it { is_expected.to(validate_uniqueness_of(:code).case_insensitive) }
  it { is_expected.to(validate_presence_of(:name)) }
  it { is_expected.to(validate_presence_of(:address)) }
  it { is_expected.to(validate_presence_of(:contact_phone)) }

end
