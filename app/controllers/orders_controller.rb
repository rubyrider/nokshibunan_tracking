class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:address, :amount, :currency, :product_name, :product_detail, :order_date, :estimated_delivery, :status_id_id, :payment_status, :payment_method_id)
    end

end
