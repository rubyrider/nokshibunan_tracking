ActiveAdmin.register Testimonial do

  menu parent: 'Other', label: 'Testimonials'

  permit_params Testimonial.column_names_excluded
end
