class CreateSidebarLinks < ActiveRecord::Migration
  def change
    create_table :sidebar_links do |t|
      t.string :name
      t.string :link_to
      t.string :icon

      t.timestamps
    end
  end
end
