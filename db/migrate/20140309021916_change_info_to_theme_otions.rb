class ChangeInfoToThemeOtions < ActiveRecord::Migration
  def change
  	#change_column :theme_options, :template, :integer

  	rename_column :theme_options, :template, :template_old
  	add_column :theme_options, :template, :integer

  	ThemeOption.reset_column_information
  	ThemeOption.find_each { |c| c.update_attribute(:template, c.template_old) }

  	remove_column :theme_options, :template_old
	end
end
