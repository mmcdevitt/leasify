class AddInfoToThemeNames < ActiveRecord::Migration
  def change
    add_column :theme_names, :description, :string
    add_attachment :theme_names, :theme_name_image
  end
end
