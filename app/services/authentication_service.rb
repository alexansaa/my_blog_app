# app/services/authentication_service.rb
class AuthenticationService
  def initialize(username, password)
    @username = username
    @password = password
  end

  def authenticate
    user = User.find_by(username: @username)

    if user&.authenticate(@password)
      JsonWebToken.encode(user_id: user.id)
    end
  end
end
