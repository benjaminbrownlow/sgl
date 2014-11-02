class AddBracketReferenceToActivity < ActiveRecord::Migration
  def self.up
  	add_reference :activities, :brackets, index: true
  end

  def self.down
  	remove_reference :activities, :brackets, index: true
  end
end
