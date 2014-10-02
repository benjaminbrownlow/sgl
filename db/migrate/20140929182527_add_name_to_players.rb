class AddNameToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :name, :string
    add_column :players, :evetag, :string
  end
end
