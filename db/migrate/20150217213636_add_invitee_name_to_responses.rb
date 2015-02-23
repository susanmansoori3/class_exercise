class AddInviteeNameToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :invitee_name, :string
  end
end
