FactoryGirl.define do
  factory :image do
    name "waterdrop"
    file do
      File.open Dir[Rails.root, 'spec', 'support', 'images', 'waterdrop.jpg']
    end
  end
end