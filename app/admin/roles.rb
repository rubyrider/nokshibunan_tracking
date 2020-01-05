ActiveAdmin.register Role do

  menu parent: 'User System', label: 'User Roles'

  record = Role.column_names_excluded

  permit_params record.each{|r| r.to_sym}

  form do |f|
    f.inputs 'Role Details' do
      f.input :name
    end

    f.actions
  end
end
