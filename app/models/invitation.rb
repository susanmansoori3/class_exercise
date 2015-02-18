class Invitation < ActiveRecord::Base
	# Consider that this is pretty much the inverse of what you find in the User model :)
	# Also has class_name, foreign_key, and inverse_of
	belongs_to :inviter, :class_name => "User", foreign_key: :inviter_id, inverse_of: :inviter_invitations

	belongs_to :invitee, :class_name => "User", foreign_key: :invitee_id, inverse_of: :invitee_invitations
end
