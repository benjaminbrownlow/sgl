class AddFlagToMatches < ActiveRecord::Migration
  def self.up
  	add_column :matches, :flag, :boolean, default: false
  end

  def self.down
  	remove_colmn :matches, :flag
  end
end
