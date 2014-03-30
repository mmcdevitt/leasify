class AddPublishedToPages < ActiveRecord::Migration
  def change
    add_column :pages, :published, :boolean, default: false
  end
end
