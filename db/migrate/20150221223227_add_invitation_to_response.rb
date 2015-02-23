class AddInvitationToResponse < ActiveRecord::Migration
  def change
    add_reference :responses, :invitation, index: true
    add_foreign_key :responses, :invitations
  end
end
