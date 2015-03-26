class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
