ActiveAdmin.register Testimonial do

  menu parent: 'Other', :label => "Testimonials"

  permit_params Testimonial.column_names.map(&:to_sym)
end
