class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

  # Error Handling
  # def get_facebook_messages
  #   begin
  #     api = new API
  #     @messages = api.facebook_messages
  #   rescue => e
  #     flash[:error] = "Error occured: #{e}"
  #   end
  # end
  # You can specifiy the type of error  rescue IOError => e
  # https://ruby-doc.org/core-2.2.0/Exception.html
  # Error Handling
end
