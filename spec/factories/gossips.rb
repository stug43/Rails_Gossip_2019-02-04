# frozen_string_literal: true

FactoryBot.define do
  factory :gossip do
    author { FactoryBot.create(:user) }
    title { Faker::Hacker.adjective }
    text { Faker::ChuckNorris.fact }

    factory :gossip_skips_validate do
      to_create { |instance| instance.save(validate: false) }
    end
  end
end
