class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    auth_token = JsonWebToken.encode(user_id: user.id) if user
    return [auth_token, user]
  end

  private

    attr_reader :email, :password

    def user
      user = User.find_by(email: email)
      return user if user && user.authenticate(password)
      raise(ExceptionHandler::AuthenticationError, "Invalid credentials")
    end
end
