require 'rails_helper'

RSpec.describe Route, type: :model do
  subject { create(:route) }

  it{is_expected.to(validate_presence_of(:name))}
  it{is_expected.to(belong_to(:region))}
  it{is_expected.to(belong_to(:source))}
  it{is_expected.to(belong_to(:destination))}
end
