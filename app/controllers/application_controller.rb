class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def url_options
    { :host => request.host }.merge(super)
  end
  
end
