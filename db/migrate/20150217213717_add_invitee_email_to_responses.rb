class AddInviteeEmailToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :invitee_email, :string
  end
end
