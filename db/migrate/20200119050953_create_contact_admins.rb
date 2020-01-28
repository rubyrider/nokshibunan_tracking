class CreateContactAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_admins do |t|
      t.string :name
      t.string :email
      t.string :contact_number
      t.text :message

      t.timestamps
    end
  end
end
