class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SourceManager
  include GuestUser
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = DevcampViewTool::Renderer.copyright "Murray Catto", "All rights reserved"
  end

end
