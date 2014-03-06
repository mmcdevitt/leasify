class AddUserIdToThemeOptions < ActiveRecord::Migration
  def change
    add_column :theme_options, :user_id, :integer
  end
end
