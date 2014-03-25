class AddStyles2ToThemeOptions < ActiveRecord::Migration
  def change
  	add_column :theme_options, :footer_size, :integer, default: 12
  	add_column :theme_options, :body_size, :integer, default: 14
  	change_column :theme_options, :mainheading_size, :integer, default: 48
  	change_column :theme_options, :subheading_size, :integer, default: 14
  	change_column :theme_options, :nav_size, :integer, default: 12
  end
end
