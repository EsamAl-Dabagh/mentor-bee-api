FactoryBot.define do
  factory :mentee do
    user
    interest { Faker::HarryPotter.spell }
    bio { Faker::HarryPotter.quote }
  end
end
