ActiveAdmin.register DeliveryMethod do

  menu parent: 'Order System', :label => "Delivery Method"

  permit_params DeliveryMethod.column_names.map(&:to_sym)
  
end
