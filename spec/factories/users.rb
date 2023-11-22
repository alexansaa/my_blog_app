require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    photo { Faker::Name.name }
    bio { Faker::Lorem.sentence }
    posts_counter { 0 }
  end
end
