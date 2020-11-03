class CreateTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :tutors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :resume
      t.string :zoom_link
      t.integer :rating
      t.boolean :puppets

      t.timestamps
    end
  end
end
