# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name + 'hhh' }
    last_name { Faker::Name.last_name + 'hhh' }
    user_name { Faker::DragonBall.unique.character + 'ajjjjk' }
    email { Faker::Internet.unique.email }
    age { (1..89).to_a.sample }
    password { Faker::Internet.password(13, 25, true, true) }
    description { 'Voilà la belle description de plus de 1000 characters' + 'a' * 100 }
    city { FactoryBot.create(:city) }
  end
end
