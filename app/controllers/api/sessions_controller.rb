module Api
  class SessionsController < Api::BaseController
    def create
      auth_service = AuthenticationService.new(params[:username], params[:password])
      my_token = auth_service.authenticate

      if my_token
        render json: { token: my_token }
      else
        render json: { error: 'Invalid credentials' }, status: :unauthorized
      end
    end
  end
end
