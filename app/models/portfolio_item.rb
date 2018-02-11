class PortfolioItem < ApplicationRecord
  include Placeholder

  has_many :technologies
  validates_presence_of :title, :body, :main_image, :thumb_image
  after_initialize :set_defaults


  scope :ruby_on_rails, -> { where(subtitle:"Ruby on Rails")}
  def self.angular
    where(subtitle:"Angular")
  end

  def set_defaults

      self.main_image ||= Placeholder.image_generator(height:600,width:400)
      self.thumb_image ||= Placeholder.image_generator(height:350,width:200)
      # ||= Prevents overwriting current values
      # Same as
      # if self.main_image.nil?
      #   self.main_image = "http://via.placeholder.com/600x400"
      # end
  end
end
