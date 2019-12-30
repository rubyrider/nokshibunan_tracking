ActiveAdmin.register Order do

  menu parent: 'Order System', :label => "Orders"

  record = Order.column_names

  permit_params record.each{|r| r.to_sym}
  
end
