ActiveAdmin.register User do

  menu parent: 'User System', label: 'Users'

  permit_params User.column_names_excluded, :password, :password_confirmation, role_ids: []

  info_columns = %i[phone_number email full_name nickname address
                    emergency_contact sex birth_date]

  info_columns.each do |attr|
    filter attr
  end

  index do
    _h = info_columns
    selectable_column
    id_column
    _h.each do |h|
      column h
    end

    column :roles do |user|
      user.roles.collect {|c| c.name.capitalize }.to_sentence
    end

    actions
  end

  show do
    attributes_table do
      info_columns.each do |h|
        row h
      end
      # row :image do |ad|
      #   image_tag ad.image.url unless ad.image.nil?
      # end

      row :roles do |user|
        user.roles.collect {|r| r.name.capitalize }.to_sentence
      end
    end

    active_admin_comments
  end

  form do |f|
    f.inputs 'User Details' do
      info_columns.each do |attr|
        f.input attr
      end
      f.input :image, as: :file
      f.input :role_ids, label: 'Roles', as: :tags, collection: Role.all, display_name: :name
      f.input :password, label: 'Pin Code'
      f.input :password_confirmation, label: 'Confirm Pin Code'
    end

    f.actions
  end

  controller do
    def create
      @user = User.new(permitted_params[:user])
      add_roles(@user)
      create!
    end

    def update
      add_roles(resource)
      update!
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end

    private

    def add_roles(resource)
      resource.roles = []
      params[:user][:role_ids].each { |r| resource.roles.push(Role.find(r)) unless r.blank? }
    end
  end
end
