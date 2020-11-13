class SwitchToMultitableInheritance < ActiveRecord::Migration[6.0]
  def change
    drop_table :users

    change_table :tutors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :image, default: "/photos/your_photo.jpeg"
      t.text :resume
      t.string :zoom_link
      t.integer :rating, default: 0
      t.boolean :puppets
      t.string :uid
    end

    change_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :image, default: "/photos/your_photo.jpeg"
      t.text :about_me
      t.integer :level, default: 0
      t.integer :gold_stars, default: 0
      t.boolean :helicopter_parent
      t.string :uid
    end

  end
end
