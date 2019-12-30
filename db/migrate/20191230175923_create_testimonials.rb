class CreateTestimonials < ActiveRecord::Migration[6.0]
  def change
    create_table :testimonials do |t|
      t.string :name
      t.string :title
      t.text :comment
      t.text :image
      t.date :comment_date

      t.timestamps
    end
  end
end
