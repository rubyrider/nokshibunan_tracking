ActiveAdmin.register Order do

  menu parent: 'Order System', label: "Orders"

  form do |f|
    f.inputs 'Order Details' do
      f.input :product_name
      f.input :product_detail, input_html: { class: 'autogrow', rows: 5 }
      f.input :product_image, as: :file
      f.input :address, input_html: { class: 'autogrow', rows: 5 }
      f.input :tracking_status
      f.input :order_date, as: :date_time_picker
      f.input :estimated_delivery_date, as: :date_time_picker
    end

    f.inputs 'Pricing & Payments' do
      f.input :price
      f.input :currency, as: :select, collection: CURRENCY.values
      f.input :delivery_fee
      f.input :delivery_method
      f.input :payment_method
      f.input :payment_status
      f.input :paid_amount
    end

    inputs 'User Details', for: :user do |u|
      u.input :phone_number, required: false, input_html: { name: 'user[phone_number]', value: resource.user&.phone_number }
      u.input :email, required: false, input_html: { name: 'user[email]', value: resource.user&.email }
      u.input :full_name, required: false, input_html: { name: 'user[full_name]', value: resource.user&.full_name }
    end

    f.actions
  end

  controller do

    def create
      resource.user_id = determine_user_id(permitted_params[:user]) if permitted_params[:user][:phone_number].present?

      super
    end

    def update
      resource.user_id = determine_user_id(permitted_params[:user]) if permitted_params[:user][:phone_number].present?

      super
    end

    def permitted_params
      record = Order.column_names
      params.permit(:_method, :id, :commit, :authenticity_token, order: record.each{|r| r.to_sym}, user: [:phone_number, :email, :full_name])
    end

    private

    def determine_user_id user_attrs
      user = User.find_by_phone_number(user_attrs[:phone_number])

      unless user.present?
        random_password = '1234'

        user = User.create(phone_number: user_attrs[:phone_number], email: user_attrs[:email],
                           full_name: user_attrs[:full_name], password: random_password,
                           password_confirmation: random_password)
      end

      user.id
    end
  end
end
