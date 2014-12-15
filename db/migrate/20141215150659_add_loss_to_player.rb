class AddLossToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :totalLoss, :integer, default: 0
  end
end
