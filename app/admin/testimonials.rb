ActiveAdmin.register Testimonial do

  menu parent: 'Other', label: 'Testimonials'

  permit_params Testimonial.column_names_excluded

  form do |f|
    f.inputs 'User Details' do
      f.input :image, as: :file
      f.input :name
      f.input :title
      f.input :comment
      f.input :comment_date
    end

    f.actions
  end
end
