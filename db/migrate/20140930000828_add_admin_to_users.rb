class AddAdminToUsers < ActiveRecord::Migration
    def self.up
    add_column :players, :admin, :boolean, :default => false
  end

  def self.down
    remove_column :players, :admin
  end
end
