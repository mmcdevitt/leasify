class AddUserIdToPropertyInformations < ActiveRecord::Migration
  def change
    add_column :property_informations, :user_id, :integer
  end
end
