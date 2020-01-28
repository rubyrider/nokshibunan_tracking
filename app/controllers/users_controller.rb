class UsersController < ApplicationController
  def check_order_user
    @data = UserServices::CheckOrderUser.new(params).perform

    respond_to :js
  end
end
