class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :title
      t.string :description
      t.integer :inviter_id
      t.integer :invitee_id

      t.timestamps null: false
    end
  end
end
