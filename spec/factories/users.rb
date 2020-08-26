FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    first_name            {"ひらがな"}
    last_name             {"ひらがな"}
    first_name_kana       {"ヒラガナ"}
    last_name_kana        {"ヒラガナ"}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6, max_length: 128)}
    password_confirmation {password}
    date                  {"1996-12-12"}
  end
end