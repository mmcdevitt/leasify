class AddStylesToThemeOptions < ActiveRecord::Migration
  def change
  	add_column :theme_options, :mainheading_size, :integer
  	add_column :theme_options, :nav_size, :integer
  	add_column :theme_options, :subheading_size, :integer
  end
end
