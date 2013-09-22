class AddAttachmentPhotoToTickets < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :tickets, :photo
  end
end
