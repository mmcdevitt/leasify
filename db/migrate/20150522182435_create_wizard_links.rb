class CreateWizardLinks < ActiveRecord::Migration
  def change
    create_table :wizard_links do |t|
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
