# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'MyString' }
    last_name { 'MyString' }
    gossiping_name { 'MyString' }
    email { 'MyString' }
    age { 1 }
  end
end
