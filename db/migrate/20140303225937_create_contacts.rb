class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :job_title
      t.string :phone
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
