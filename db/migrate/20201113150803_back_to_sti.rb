class BackToSti < ActiveRecord::Migration[6.0]
  def change
    drop_table :tutors
    drop_table :students

    create_table :users do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :image, default: "/photos/your_photo.jpeg"
      t.text :resume
      t.string :zoom_link
      t.integer :rating, default: 0
      t.boolean :puppets
      t.text :about_me
      t.integer :level, default: 0
      t.integer :gold_stars, default: 0
      t.boolean :helicopter_parent
      t.string :uid
    end

    create_table :tutors
    create_table :students
  end
end
