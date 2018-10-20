class AuthorizeApiRequest
  def self.get_user(encoded_token)
    raise(ExceptionHandler::MissingToken, "Missing token") if encoded_token.blank?
    token_data = JsonWebToken.decode(encoded_token)
    User.find(token_data[:user_id])
  end
end
