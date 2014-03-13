class CreateAvailabilityGalleries < ActiveRecord::Migration
  def change
    create_table :availability_galleries do |t|
      t.integer :user_id
      t.integer :site_id
      t.integer :availabilities_id

      t.timestamps
    end
    add_attachment :availability_galleries, :availability_image
  end
end
