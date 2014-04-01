class AddFeaturedOnPages < ActiveRecord::Migration
  def change
  	add_column :pages, :feature_on_homepage, :boolean, default: false
  end
end
