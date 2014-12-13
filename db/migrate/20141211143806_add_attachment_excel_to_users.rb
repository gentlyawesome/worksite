class AddAttachmentExcelToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :excel
    end
  end

  def self.down
    remove_attachment :users, :excel
  end
end
