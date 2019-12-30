ActiveAdmin.register PaymentMethod do

  menu parent: 'Order System', :label => "Payment Method"

  record = PaymentMethod.column_names

  permit_params record.each{|r| r.to_sym}
end
