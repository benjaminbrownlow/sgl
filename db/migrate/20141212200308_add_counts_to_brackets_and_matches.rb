class AddCountsToBracketsAndMatches < ActiveRecord::Migration
  def self.up
  	add_column :brackets, :count, :integer
  	add_column :matches, :count, :integer
  end

  def self.down
  	remove_column :brackets, :count, :integer
  	remove_column :matches, :count, :integer
  end
end
