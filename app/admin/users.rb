ActiveAdmin.register User do

  menu parent: 'User System', :label => "Users"

  record = User.column_names

  permit_params record.each{|r| r.to_sym}
end
