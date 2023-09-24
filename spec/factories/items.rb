FactoryBot.define do
  factory :item do
    item_name            { Faker::Lorem.characters(number: 40) }
    item_info            { Faker::Lorem.characters(number: 1000) }
    item_category_id     { 2 }
    item_sales_status_id { 2 }
    sipping_fee_id       { 2 }
    prefecture_id        { 2 }
    sipping_day_id       { 2 }
    item_price           { 300 }
    association :user

    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
