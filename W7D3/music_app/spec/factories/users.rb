FactoryBot.define do
  
  factory :user do
    email { Faker::Internet.email }
    password { "password123" }
  end

  factory :theo do
    email { "theo@mantz.io" }
    password { "OreoCat2017"}
  end
end
