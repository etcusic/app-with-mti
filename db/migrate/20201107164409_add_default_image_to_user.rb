class AddDefaultImageToUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :image, :string, default: "/photos/your_photo.jpeg"
  end
end
