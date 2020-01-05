ActiveAdmin.register DeliveryMethod do

  menu parent: 'Order System', label: 'Delivery Method'

  permit_params DeliveryMethod.column_names_excluded
  
end
