FactoryBot.define do
  factory :purchase_information do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    postal_code { "#{Faker::Number.decimal_part(digits: 3)}-#{Faker::Number.decimal_part(digits: 4)}" }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    municipalities { Faker::Address.city }
    street_address { Faker::Address.street_address }
    build_name { Faker::Address.secondary_address }
    tel { '09012345678' }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
