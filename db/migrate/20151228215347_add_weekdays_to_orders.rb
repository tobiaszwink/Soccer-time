class AddWeekdaysToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :weekday, :string
  end
end
