require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    photo { Faker::Name.name }
    bio { Faker::Lorem.sentence }
    posts_counter { 0 }
  end
end
