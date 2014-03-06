class AddImageToPages < ActiveRecord::Migration
  def change
  	add_attachment :pages, :page_image
  end
end
