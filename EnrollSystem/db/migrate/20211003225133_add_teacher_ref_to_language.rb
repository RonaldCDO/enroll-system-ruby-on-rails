class AddTeacherRefToLanguage < ActiveRecord::Migration[6.1]
  def change
    add_reference :languages, :teacher, null: false, foreign_key: true
  end
end
