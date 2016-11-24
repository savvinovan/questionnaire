FactoryGirl.define do
  factory :user do
    email "some@email.com"
    password "123Qwe123"
    password_confirmation "123Qwe123"
    factory :admin do
      admin true
    end
    factory :user_with_department do
      after(:create) do |user|
        create(:department_with_questions, questions_count: 15 , user: user)
      end
    end
  end
end
