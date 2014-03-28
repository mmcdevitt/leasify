class AddTexttransformToThemeOptions < ActiveRecord::Migration
  def change
  	add_column :theme_options, :heading_text_transform, :string, default: "capitalize"
  end
end
