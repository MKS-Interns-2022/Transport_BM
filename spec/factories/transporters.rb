FactoryBot.define do
  factory :transporter do
    code { Faker::Code.npi }
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    contact_phone { Faker::PhoneNumber.cell_phone_in_e164 }
  end
end
