class AddImageToUsers < ActiveRecord::Migration
  def change
  	add_attachment :users, :logo_image
  end
end
