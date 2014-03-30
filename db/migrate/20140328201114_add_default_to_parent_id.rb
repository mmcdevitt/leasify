class AddDefaultToParentId < ActiveRecord::Migration
  def change
  	change_column :pages, :parent_id, :integer, default: nil
  end
end
