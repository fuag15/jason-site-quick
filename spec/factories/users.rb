FactoryGirl.define do
  sequence(:email) do |n|
    "test#{n}@test.com"
  end

  factory :user do
    email
    password 'testpassword'
  end
end
