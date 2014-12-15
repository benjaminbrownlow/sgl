class ChangeBracketDefaultToOne < ActiveRecord::Migration
  def change
  	change_column :brackets, :count, :integer, null: false, default: 1
  end
end
