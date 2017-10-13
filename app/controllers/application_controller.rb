class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def get
  	redirect_to courses_url
  end
end
