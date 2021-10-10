class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :registration_number
      t.string :email
      t.date :born_date

      t.timestamps
    end
  end
end
