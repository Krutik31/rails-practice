class AddRemoveAgeReversible < ActiveRecord::Migration[7.0]
  def change
    reversible do |ope|
      ope.up {remove_column :authors, :age, :integer}
      ope.down {add_column :authors, :age, :integer}
    end
  end
end
