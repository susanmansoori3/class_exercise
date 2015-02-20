class AddUserToInvitation < ActiveRecord::Migration
  def change
    add_reference :invitations, :user, index: true
    add_foreign_key :invitations, :users
  end
end
