# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:name) do |n|
    "article#{n}"
  end

  factory :article do
    name
    content "Article Text"
  end
end
