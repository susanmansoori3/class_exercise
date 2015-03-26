class AddAttachmentVideoToResponses < ActiveRecord::Migration
  def self.up
    change_table :responses do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :responses, :video
  end
end
