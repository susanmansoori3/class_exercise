class AddRecipientEmailToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :recipient_email, :string
  end
end
