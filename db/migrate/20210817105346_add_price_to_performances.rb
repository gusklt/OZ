class AddPriceToPerformances < ActiveRecord::Migration[6.0]
  def change
    add_column :performances, :price, :float
  end
end
