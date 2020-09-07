FactoryBot.define do
  factory :address_purchase do
    post_code              {"123-4567"}
    city                   {"東京都"}
    prefecture_id          { 2 }
    building_name          {"あいうえお"}
    phone_number           {"09000000000"}
    address                {"1-1"}
    purchase_id            { 2 }
    token                  {"123456"}
    #number                 {"4242424242424242"}
    #exp_month              {"11"}
    #exp_year               {"26"}
    #cvc                    {"123"}
  end
end