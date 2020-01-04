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
      f.input :currency, as: :select, collection: ISO3166::Country.countries.sort_by(&:name)
                                                      .collect { |c| [ c.currency_code, c.currency_code ] }
      f.input :delivery_fee
      f.input :delivery_method
      f.input :payment_method
      f.input :payment_status
      f.input :paid_amount
    end

    inputs 'User Details', for: :user do |u|
      u.input :phone_number, required: false, input_html: { name: 'user[phone_number]', value: resource.user&.phone_number }
      u.input :country, required: false,
              input_html: { name: 'user[country_code]' },
              as: :select, collection: ISO3166::Country.countries.sort_by(&:name)
                                           .collect { |c| [ c.name, c.alpha2 ] },
              selected: resource.user&.country_code
      u.input :email, required: false, input_html: { name: 'user[email]', value: resource.user&.email }
      u.input :full_name, required: false, input_html: { name: 'user[full_name]', value: resource.user&.full_name }
    end

    f.has_many :notes do |link_f|
      link_f.inputs "Notes" do
        link_f.input :body, input_html: { class: 'autogrow', rows: 3 }
      end
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
      params.permit(order: [:address, :price, :currency, :product_name, :product_detail, :product_image, :order_date, :estimated_delivery_date, :payment_status, :payment_method_id, :tracking_status_id, :delivery_method_id, :paid_amount, :delivery_fee, notes_attributes: {}],
                    user:  %i[phone_number email full_name country_code])
    end

    private

    def determine_user_id user_attrs
      phone_number = PhonyRails.normalize_number(user_attrs[:phone_number], country_code: user_attrs[:country_code])

      user = User.find_by_phone_number(phone_number)
      if user.present?
        user.assign_attributes(email: user_attrs[:email], full_name: user_attrs[:full_name],
                               country_code: user_attrs[:country_code])

        user.save!
      else
        random_password = rand.to_s[2..5]

        user = User.create(phone_number: user_attrs[:phone_number], email: user_attrs[:email],
                           full_name: user_attrs[:full_name], password: random_password,
                           password_confirmation: random_password, country_code: user_attrs[:country_code])
      end
      user.id
    end
  end
end
