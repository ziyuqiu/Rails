class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  # Include the authenticity token in remote forms.
  # config.action_view.embed_authenticity_token_in_remote_forms = true
end
