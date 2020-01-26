class OrdersController < ApplicationController
  before_action :find_order, only: %i[edit update]
  before_action :find_order_form_accessibility, only: :edit

  def edit; end

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
        format.html { redirect_to root_path, alert: t('order.errors.invalid_link') }
      end
    end
  end

  def order_params
    params.require(:order).permit(:address, :note)
  end

end
