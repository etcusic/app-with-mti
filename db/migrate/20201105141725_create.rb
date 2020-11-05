class Create < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :date_time
      t.belongs_to :tutor
      t.belongs_to :student
      t.timestamps
    end
  end
end
