module Placeholder
  # extend ActiveSupport::Concern
  # Should add the above line for extra Concern Fuctionality

  def self.image_generator(height:,width:)
    "http://via.placeholder.com/#{height}x#{width}"
  end
end
