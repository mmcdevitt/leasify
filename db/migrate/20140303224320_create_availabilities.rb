class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.string :title
      t.string :suite_or_floor
      t.string :availability
      t.integer :sf
      t.integer :rental_rate
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
