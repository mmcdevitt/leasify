class CreatePropertyInformations < ActiveRecord::Migration
  def change
    create_table :property_informations do |t|
      t.string :name

      t.timestamps
    end
  end
end
