class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :time
      t.references :schools, index: true, foreign_key: true
    end
  end
end
