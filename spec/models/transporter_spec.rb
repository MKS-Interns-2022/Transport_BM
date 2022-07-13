require 'rails_helper'

RSpec.describe Transporter, type: :model do

  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:contact_phone) }
  
end
