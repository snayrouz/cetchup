FactoryBot.define do
  factory :list do
    association :board
    title { Faker::Book.title }
  end
end
