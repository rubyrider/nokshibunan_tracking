ActiveAdmin.register PaymentMethod do

  menu parent: 'Order System', label: 'Payment Method'

  permit_params PaymentMethod.column_names_excluded

end
