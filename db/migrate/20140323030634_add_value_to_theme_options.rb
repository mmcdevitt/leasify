class AddValueToThemeOptions < ActiveRecord::Migration
  def change
  	change_column :theme_options, :homepage_heading, :string, default: "Welcome to Our Site!"
  	change_column :theme_options, :homepage_subheading, :string, default: "You can write something else here."
  end
end
