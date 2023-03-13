class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :department
      t.string :phone_number
      t.string :email
      t.boolean :terms_of_usage

      t.timestamps
    end
  end
end
