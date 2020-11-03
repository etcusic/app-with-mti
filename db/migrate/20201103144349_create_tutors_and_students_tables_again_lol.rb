class CreateTutorsAndStudentsTablesAgainLol < ActiveRecord::Migration[6.0]
  def change
    create_table :tutors
    create_table :students
  end
end
