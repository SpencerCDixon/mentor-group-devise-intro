FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@email.com" }
    password '12345678'
  end
end
