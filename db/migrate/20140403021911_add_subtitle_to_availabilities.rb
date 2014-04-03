class AddSubtitleToAvailabilities < ActiveRecord::Migration
  def change
    add_column :availabilities, :subtitle, :string
  end
end
