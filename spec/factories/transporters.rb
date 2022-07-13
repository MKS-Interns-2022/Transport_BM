FactoryBot.define do
  factory :transporter do
    code { FFaker::Code.rgb_array }
    name { FFaker::Name.name }
    address { FFaker::Address.street_address }
    contact_phone { FFaker::PhoneNumberUA.international_mobile_phone_number }
  end
end
