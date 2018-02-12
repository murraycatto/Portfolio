class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SourceManager
  include GuestUser
  include DefaultPageContent
end
