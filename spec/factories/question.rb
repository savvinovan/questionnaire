FactoryGirl.define do
  factory :question do
    text Faker::Lorem.sentence
    name Faker::Number.digit
  end
end
