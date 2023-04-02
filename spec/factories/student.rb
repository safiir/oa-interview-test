FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    gender { ["male", "female"].sample }
    bio { Faker::University.name}
  end
end
  