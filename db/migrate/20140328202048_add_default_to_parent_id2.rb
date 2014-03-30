class AddDefaultToParentId2 < ActiveRecord::Migration
  def change
  	change_column :pages, :parent_id, :integer, default: nil, null: true
  end
end
