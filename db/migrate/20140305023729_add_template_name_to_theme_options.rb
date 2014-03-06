class AddTemplateNameToThemeOptions < ActiveRecord::Migration
  def change
    add_column :theme_options, :template, :string
  end
end
