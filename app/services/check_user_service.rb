class CheckUserService
  attr_accessor :value, :locale, :country_code

  def initialize(params)
    @value = params[:value]
    @locale = params[:locale]
    @country_code = determine_country_code(params[:country_code])
  end

  def perform
    return nil if value.nil?
    user = if login_is_email
             User.find_by_email(value)
           else
             format_phone_number
             User.find_by_phone_number(value)
           end
    return nil unless user.present?

    user_data user
  end

  private

  def determine_country_code(country_code)
    return 'BD' unless country_code.present?

    country_code
  end

  def login_is_email
    true if Constants::Regex::EMAIL_REGEX.match(value).present?
  end

  def format_phone_number
    @value = PhonyRails.normalize_number(value, country_code: country_code)
  end

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
