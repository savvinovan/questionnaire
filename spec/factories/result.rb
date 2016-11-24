FactoryGirl.define do
  factory :result do
    department_id Faker::Number.digit
    user_id Faker::Number.digit
    question_id Faker::Number.digit
    text Faker::Lorem.paragraph(sentence_count = 3)
  end
end
