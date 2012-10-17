class ApplicationController < ActionController::Base
  protect_from_forgery

  #It outputs an error message to mention you are not allowed to
  #see the page
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

end
