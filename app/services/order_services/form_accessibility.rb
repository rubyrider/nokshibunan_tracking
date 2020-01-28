# frozen_string_literal: true

module OrderServices
  class FormAccessibility
    attr_accessor :order_form_token, :params_token

    def initialize(order, params_token)
      @order_form_token = order.order_form_token
      @params_token = params_token
    end

    def check
      return false unless token && token_matched && valid

      order_form_token.update(accessed_at: Time.current) unless order_form_token.accessed_at.present?

      true
    end

    private

    def token
      @order_form_token.present?
    end

    def token_matched
      @order_form_token.token == params_token
    end

    def valid
      order_form_token.is_valid_token
    end

  end
end