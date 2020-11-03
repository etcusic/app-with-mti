class CreateStudentsTableAgain < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
    end
  end
end
