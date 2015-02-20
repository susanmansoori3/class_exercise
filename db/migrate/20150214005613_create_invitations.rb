class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
