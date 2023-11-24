# app/controllers/api/sessions_controller.rb
module Api
  class SessionsController < ApplicationController
    def create
      auth_service = AuthenticationService.new(params[:username], params[:password])
      token = auth_service.authenticate

      if token
        render json: { token: token }
      else
        render json: { error: 'Invalid credentials' }, status: :unauthorized
      end
    end
  end
end
