class CreateThemeOptions < ActiveRecord::Migration
  def change
    create_table :theme_options do |t|
    	t.string :homepage_heading
    	t.string :homepage_subheading
    	t.text :content

      t.timestamps
    end
    add_attachment :theme_options, :theme_image
  end
end
