class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :template_name
  	remove_attachment :users, :logo_image
  end
end
