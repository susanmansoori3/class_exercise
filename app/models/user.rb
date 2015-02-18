require 'bcrypt'
class User < ActiveRecord::Base
	has_secure_password
  has_many :photos
  # From the perspective of a user, they might have sent out many invitations
  # Because the foreign key does not match the model name, we need to specify 3 additional
  # things in order to make this association... class_name, foreign_key, and inverse_of
  # inverse_of from the perspective of a has_many should call out the name of the corresponding
  # belongs_to!
	has_many :inviter_invitations, :class_name => "Invitation", foreign_key: :inviter_id, inverse_of: :inviter

	has_many :invitee_invitations, :class_name => "Invitation", foreign_key: :invitee_id, inverse_of: :invitee

end
