FactoryGirl.define do
  factory :user do
    email "some@email.com"
    password "123Qwe123"
    password_confirmation "123Qwe123"

    factory :admin do
      admin true
    end
  end
end
