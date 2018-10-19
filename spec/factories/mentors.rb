FactoryBot.define do
  factory :mentor do
    user
    skill { Faker::HarryPotter.spell }
    bio { Faker::HarryPotter.quote }
  end
end
