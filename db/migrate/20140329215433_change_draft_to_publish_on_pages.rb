class ChangeDraftToPublishOnPages < ActiveRecord::Migration
  def change
  	change_column :pages, :published, :boolean, default: true
  end
end
