class AddRecipientToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :recipient, :string
  end
end
