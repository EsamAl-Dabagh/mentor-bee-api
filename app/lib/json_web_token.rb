class JsonWebToken
  SECRET_SIGNATURE = MentorBeeApi::Application.credentials.secret_key_base

  def self.encode(user, expiry = 24.hours.from_now)
    user[:exp] = expiry.to_i
    JWT.encode(user, SECRET_SIGNATURE)
  end

  def self.decode(token)
    body = JWT.decode(token, SECRET_SIGNATURE)[0]
    HashWithIndifferentAccess.new body

    rescue JWT::DecodeError => error
      raise ExceptionHandler::InvalidToken, error.message
  end
end
