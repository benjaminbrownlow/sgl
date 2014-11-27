class AddDateTimeToMatches < ActiveRecord::Migration
  def self.up
  	add_column :matches, :matchDate, :datetime
  end

  def self.down
  	remove_column :matches, :matchDate, :datetime
  end
end
