require 'bcrypt'

class User < ActiveRecord::Base
	
  has_secure_password
  has_many :photos

  has_many :invitations

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_length_of :email, maximum: 255
  validates_presence_of :password_digest

end
