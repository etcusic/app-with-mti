class AddDefaultForRatingAndLevel < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :level, :integer, default: 0
    change_column :users, :rating, :integer, default: 0
    change_column :users, :gold_stars, :integer, default: 0
  end
end
