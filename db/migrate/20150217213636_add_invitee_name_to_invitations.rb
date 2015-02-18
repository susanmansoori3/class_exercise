class AddInviteeNameToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :invitee_name, :string
  end
end
