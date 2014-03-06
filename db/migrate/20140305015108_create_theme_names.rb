class CreateThemeNames < ActiveRecord::Migration
  def change
    create_table :theme_names do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
