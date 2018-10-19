module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do

    rescue_from ActiveRecord::RecordInvalid do |error|
      json_response({ message: error.message }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotFound do |error|
      json_response({ message: error.message }, :not_found)
    end

    rescue_from ExceptionHandler::AuthenticationError do |error|
      json_response({ message: error.message }), :unauthorized)
    end

    rescue_from ExceptionHandler::MissingToken do |error|
      json_response({ message: error.message }, :unprocessable_entity)
    end

    rescue_from ExceptionHandler::InvalidToken do |error|
      json_response({ message: error.message }, :unprocessable_entity)
    end

  end
end
