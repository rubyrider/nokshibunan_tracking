# frozen_string_literal: true

module OrderServices
  class Updater
    attr_accessor :order, :params, :user

    def initialize(order, params, user)
      @order = order
      @params = params[:order]
      @user = user
    end

    def perform
      save_note if params[:note].present?

      order.update(address: params[:address], user_id: user.id)
    end

    private

    def save_note
      order.build_note(body: message).save
    end
  end
end