ActiveAdmin.register Role do

  menu parent: 'User System', :label => "User Roles"

  record = Role.column_names

  permit_params record.each{|r| r.to_sym}
  
end
