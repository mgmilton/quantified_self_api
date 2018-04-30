class RemovesMealFromFood < ActiveRecord::Migration[5.1]
  def change
    remove_column :foods, :meal_id
  end
end
