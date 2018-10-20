class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
