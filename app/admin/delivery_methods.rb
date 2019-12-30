ActiveAdmin.register DeliveryMethod do

  menu parent: 'Order System', :label => "Delivery Method"

  record = DeliveryMethod.column_names

  permit_params record.each{|r| r.to_sym}
  
end
