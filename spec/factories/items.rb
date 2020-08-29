FactoryBot.define do
  factory :item do
  association :user
  name                {"あいうえお"}
  postage_id          { 2 }
  area_id             { 4 }
  category_id         { 2 }
  status_id           { 2 }
  price               {Faker::Number.number(digits: 4)}
  shipping_charges_id  { 3 }
  info                {"あいうえお"}
  end
end
