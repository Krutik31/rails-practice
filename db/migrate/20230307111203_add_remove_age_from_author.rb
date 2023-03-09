class AddRemoveAgeFromAuthor < ActiveRecord::Migration[7.0]
  def up
    add_column :authors, :age, :integer
  end

  def down
    remove_column :authors, :age, :integer
  end
end
