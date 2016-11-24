FactoryGirl.define do
  factory :department do
    name Faker::Commerce.department
    factory :department_with_questions do
      transient do
        questions_count 5
      end

      after(:create) do |department, evaluator|
        create_list(:question, evaluator.questions_count, departments: [department])
      end

    end
  end
end
