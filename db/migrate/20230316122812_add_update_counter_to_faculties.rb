class AddUpdateCounterToFaculties < ActiveRecord::Migration[7.0]
  def change
    add_column :faculties, :update_counter, :integer, default: 0
  end
end
