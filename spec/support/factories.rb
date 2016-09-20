FactoryGirl.define do
  factory :item do
    name
    description "description for item"
    image_url "www.example.com"
  end

  sequence :name do |n|
    "Name #{n}"
  end
end
