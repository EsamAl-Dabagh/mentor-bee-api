module ControllerSpecHelper
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, 1.day.ago.to_i)
  end

  def valid_headers
    {
      "Authorization" => token_generator(create(:user).id),
      "Content-Type" => "application/json"
    }
 end

  def invalid_headers
    {
      "Authorization" => nil,
      "Content-Type" => "application/json"
    }
   end
end
