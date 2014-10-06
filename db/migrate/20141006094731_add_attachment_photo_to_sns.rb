class AddAttachmentPhotoToSns < ActiveRecord::Migration
  def self.up
    change_table :sns do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :sns, :photo
  end
end
