class AddWeekdaysToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :weekdays, :string, array: true, default: []
  end
end
