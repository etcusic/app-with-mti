class ConsolidateStudentsAndTutorsIntoUsers < ActiveRecord::Migration[6.0]
  def down
    drop_table :tutors
    drop_table :students
  end

  def up
    create_table :users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "email"
      t.string "password_digest"
      t.text "resume"
      t.string "zoom_link"
      t.integer "rating"
      t.boolean "puppets"
      t.text "about_me"
      t.integer "level"
      t.integer "gold_stars"
      t.boolean "helicopter_parent"
    end
  end
end
