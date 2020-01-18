class OrdersController < ApplicationController
  before_action :find_order, only: %i[edit update]
  before_action :find_order_form_accessibility, only: :edit

  def edit
    @user = User.new
  end

  def update

  end

  def track

  end

  private

  def find_order
    @order = Order.friendly.find(params[:id])
  end

  def find_order_form_accessibility
    accessibility = false
    accessibility = OrderFormAccessibilityService.new(@order, params[:token]).check if params[:token].present?

    unless accessibility
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'Link not available! Please contact admin.' }
      end
    end
  end

  def order_params
    params.require(:order).permit(:address, :amount, :currency, :product_name, :product_detail, :order_date, :estimated_delivery, :status_id, :payment_status, :payment_method_id)
  end

end
