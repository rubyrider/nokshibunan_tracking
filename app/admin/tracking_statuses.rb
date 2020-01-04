ActiveAdmin.register TrackingStatus do

  menu parent: 'Order System', :label => "Tracking Status"

  permit_params TrackingStatus.column_names.map(&:to_sym)
end
