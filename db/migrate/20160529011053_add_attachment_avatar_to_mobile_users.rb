class AddAttachmentAvatarToMobileUsers < ActiveRecord::Migration
  def self.up
    change_table :mobile_users do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :mobile_users, :avatar
  end
end
