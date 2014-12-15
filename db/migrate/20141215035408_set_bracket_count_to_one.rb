class SetBracketCountToOne < ActiveRecord::Migration
  def change
  	change_column :brackets, :count, :integer, null: false, default: 0
  end
end
