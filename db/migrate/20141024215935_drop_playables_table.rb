class DropPlayablesTable < ActiveRecord::Migration
  def change
  	drop_table :playables
  end
end
