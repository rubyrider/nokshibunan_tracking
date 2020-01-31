class OrdersController < ApplicationController
  before_action :find_order, only: %i[edit update]
  before_action :find_order_form_accessibility, only: :edit
  before_action :authenticate_user!, only: :track

  def edit; end

  def update
    @user, @message = UserServices::ValidateOrCreateOrderUser.new(order_params[:user]).perform

    respond_to do |format|
      if @user.present?
        OrderServices::Updater.new(@order, params, @user).perform

        return redirect_to root_path, notice: t('order.success')
      else
        format.js
      end
    end
  end

  def track
    @orders = current_user.orders.all
    @tracking_statuses = TrackingStatus.all

    respond_to do |format|
      format.html
    end
  end

  private

  def find_order
    @order = Order.friendly.find(params[:id])
  end

  def find_order_form_accessibility
    accessibility = false
    accessibility = OrderServices::FormAccessibility.new(@order, params[:token]).check if params[:token].present?

    unless accessibility
      respond_to do |format|
        format.html { redirect_to root_path, alert: t('order.errors.invalid_link') }
      end
    end
  end

  def order_params
    params.require(:order).permit(:address, :note, user: {})
  end

end
