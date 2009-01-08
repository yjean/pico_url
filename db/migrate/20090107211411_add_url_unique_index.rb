class AddUrlUniqueIndex < ActiveRecord::Migration
  def self.up
    add_index :locations, :url, :unique => true
  end

  def self.down
    remove_index :locations; :url
  end
end
