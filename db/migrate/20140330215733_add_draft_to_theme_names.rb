class AddDraftToThemeNames < ActiveRecord::Migration
  def change
  	add_column :theme_names, :published, :boolean, default: true
  end
end
