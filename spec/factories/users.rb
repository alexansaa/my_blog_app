require 'faker'

FactoryBot.define do
  factory :user do
    @name = Faker::Name.name
    name { @name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    photo { @name }
    bio { Faker::Lorem.sentence }
    posts_counter { 0 }
  end
  factory :user_with_confirmation, parent: :user do
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
    email { Faker::Internet.unique.email }
    name { Faker::Name.name }
  end
end
