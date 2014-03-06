class AddTemplateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :template_name, :string
  end
end
