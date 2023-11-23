require 'faker'

FactoryBot.define do
  factory :post do
    association :user
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    comments_counter { 0 }
    likes_counter { 0 }
  end
end
