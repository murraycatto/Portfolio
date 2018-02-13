class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SourceManager
  include GuestUser
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = DevCampViewTool::Renderer.copyright "Murray Catto", "All rights reserved"
  end

end

module DevCampViewTool
  class Renderer
    def self.copyright name, message
      "&copy; #{Time.now.year} | <b>#{name}</b> #{message}".html_safe
    end
  end
end
