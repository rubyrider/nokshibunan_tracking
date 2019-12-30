ActiveAdmin.register TrackingStatus do

  menu parent: 'Order System', :label => "Tracking Status"

  record = TrackingStatus.column_names

  permit_params record.each{|r| r.to_sym}
  
end
