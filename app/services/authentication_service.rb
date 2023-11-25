# app/services/authentication_service.rb
class AuthenticationService
  def initialize(username, password)
    @username = username
    @password = password
  end

  def authenticate
    user = User.find_by(username: @username)

    JsonWebToken.encode(user_id: user.id) if user&.authenticate(@password)
  end
end
