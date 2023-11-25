require 'swagger_helper'
require 'rails_helper'

describe 'Users API' do
  path '/api/users' do
    post 'Create a user with API' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :user,
        properties: {
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string },
          name: { type: :string }
        },
        required: ['email', 'password', 'password_confirmation' 'name']
      }
      response '201', 'user created' do
        let(:user) { FactoryBot.create(:user_with_confirmation) }
        run_test!
      end
    end
  end
end
