class DropTutorsAndStudentsTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :tutors
    drop_table :students
  end
end
