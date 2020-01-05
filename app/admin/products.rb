ActiveAdmin.register Product do

  menu parent: 'Other', label: 'Products'

  permit_params Product.column_names_excluded
end
