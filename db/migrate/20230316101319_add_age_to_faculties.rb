class AddAgeToFaculties < ActiveRecord::Migration[7.0]
  def change
    add_column :faculties, :age, :integer
  end
end
