FactoryBot.define do
  factory :teacher do
    name { Faker::Name.name }
    gender { ["male", "female"].sample }
    bio { Faker::University.name}
  end
end
  