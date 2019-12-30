ActiveAdmin.register Product do

  menu parent: 'Other', :label => "Products"

  record = Product.column_names

  permit_params record.each{|r| r.to_sym}
  
end
