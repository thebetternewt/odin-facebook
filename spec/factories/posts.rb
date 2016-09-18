FactoryGirl.define do
  factory :post do
    content { Faker::StarWars.quote }
    user
    created_at { Faker::Time.backward(30) }
  end
end
