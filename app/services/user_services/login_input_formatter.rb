# frozen_string_literal: true

module UserServices
  class LoginInputFormatter
    attr_accessor :value, :country_code

    def initialize(value, country_code = nil)
      @value = value
      @country_code = country_code.present? ? country_code : 'BD'
    end

    def find_user
      user = if valid_email_format?
               User.find_by_email(value)
             else
               format_phone_number
               User.find_by_phone_number(value)
             end

      user
    end

    def format_phone_number
      @value = PhonyRails.normalize_number(value, country_code: country_code)
    end

    def valid_email_format?
      Constants::Regex::EMAIL_REGEX.match(value).present?
    end
  end
end