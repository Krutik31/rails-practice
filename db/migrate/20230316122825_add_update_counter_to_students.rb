class AddUpdateCounterToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :update_counter, :integer, default: 0
  end
end
