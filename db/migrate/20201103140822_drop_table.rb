class DropTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :tutors
  end
end
