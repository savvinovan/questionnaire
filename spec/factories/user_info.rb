FactoryGirl.define do
  factory :user_info do
    name Faker::Name.name_with_middle
    department Faker::Commerce.department
    contact Faker::Address.street_address
    user_id Faker::Number.digit
  end
end
