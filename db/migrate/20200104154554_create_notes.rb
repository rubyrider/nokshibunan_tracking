class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :noteable_type
      t.integer :noteable_id
      t.text :body

      t.timestamps
    end
  end
end
