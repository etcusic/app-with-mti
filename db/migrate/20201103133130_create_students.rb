class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :about_me
      t.integer :level
      t.integer :gold_stars
      t.boolean :helicopter_parent

      t.timestamps
    end
  end
end
