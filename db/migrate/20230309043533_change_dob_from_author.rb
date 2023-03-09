class ChangeDobFromAuthor < ActiveRecord::Migration[7.0]
  def change
    reversible do |ope|
      ope.up {rename_column :authors, :dob, :date_of_birth}
      ope.down {rename_column :authors, :date_of_birth, :dob}
    end
  end
end
