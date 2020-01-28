# frozen_string_literal: true

module UserServices
  class CheckOrderUser
    attr_accessor :value, :locale, :country_code

    def initialize(params)
      @value = params[:value]
      @locale = params[:locale]
      @country_code = params[:country_code]
    end

    def perform
      return nil if value.nil?
      user = UserServices::LoginInputFormatter.new(value, country_code).find_user
      return nil unless user.present?

      user_data user
    end

    private

    def user_data user
      {
          name: user.full_name,
          address: user_address(user)
      }
    end

    def user_address user
      if user.address.present?
        user.address
      elsif user.orders&.last&.address.present?
        user.orders.last.address
      else
        nil
      end
    end
  end
end
