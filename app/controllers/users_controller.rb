class UsersController < ApplicationController
  def show

  end

  def check_order_user
    @data = CheckUserService.new(params).perform

    respond_to do |format|
      format.js
    end
  end
end
