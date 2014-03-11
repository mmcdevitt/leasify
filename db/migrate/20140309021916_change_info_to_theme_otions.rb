class ChangeInfoToThemeOtions < ActiveRecord::Migration
  def change
  	change_column :theme_options, :template, :integer
  end
end
