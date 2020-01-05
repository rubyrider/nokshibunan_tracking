ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1
  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      panel 'Order Stats', style: 'margin-bottom: 50px; width: 100%' do
        render 'order_summary'
      end
    end

    columns do
      panel 'Upcoming Deliveries', style: 'margin-bottom: 50px; width: 100%' do
        table_for Order.order('estimated_delivery_date desc').includes(:tracking_status).limit(10) do
          column('Product Name') { |order| link_to(order.product_name, admin_order_path(order)) }
          column('Customer') { |order| link_to(order.user&.phone_number, admin_users_path(order.user)) }
          column('Order Date', &:order_date)
          column('Estimated Delivery Date', &:estimated_delivery_date)
          column('Payment Status') { |order| status_tag(order.payment_status) }
          column('Paid Amount', &:paid_amount)
          column('Tracking Status') { |order| status_tag(order.tracking_status.name) }
        end
      end
    end

    columns do
      column do
        panel 'Recent Orders' do
          table_for Order.order('id desc').limit(10) do
            column('Product Name') { |order| link_to(order.product_name, admin_order_path(order)) }
            column('Customer') { |order| link_to(order.user&.phone_number, admin_users_path(order.user)) }
            column('Order Date', &:order_date)
            column('Estimated Delivery Date', &:estimated_delivery_date)
          end
        end
      end

      column do
        panel 'Recent Customers' do
          table_for User.order('id desc').limit(10).each do |_user|
            column(:phone_number) { |user| link_to(user.phone_number, admin_user_path(user)) }
            column(:full_name, &:full_name)
          end
        end
      end
    end
  end # content
end
