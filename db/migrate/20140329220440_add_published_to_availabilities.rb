class AddPublishedToAvailabilities < ActiveRecord::Migration
  def change
    add_column :availabilities, :published, :boolean, default: true
  end
end
