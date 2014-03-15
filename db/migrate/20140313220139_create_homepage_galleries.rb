class CreateHomepageGalleries < ActiveRecord::Migration
  def change
    create_table :homepage_galleries do |t|
      t.integer :user_id
      t.integer :site_id

      t.timestamps
    end
    add_attachment :homepage_galleries, :homepage_gallery_image
  end
end
