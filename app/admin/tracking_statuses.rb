ActiveAdmin.register TrackingStatus do

  menu parent: 'Order System', label: 'Tracking Status'

  permit_params TrackingStatus.column_names_excluded
end
