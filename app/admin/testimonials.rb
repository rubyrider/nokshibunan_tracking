ActiveAdmin.register Testimonial do

  menu parent: 'Other', :label => "Testimonials"

  record = Testimonial.column_names

  permit_params record.each{|r| r.to_sym}
  
end
