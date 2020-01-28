class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[phone_number email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[login password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[phone_number email password password_confirmation current_password])
  end

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym

    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end
end
