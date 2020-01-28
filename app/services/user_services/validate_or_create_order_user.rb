module UserServices
  class ValidateOrCreateOrderUser
    attr_accessor :login, :password, :password_confirmation, :country_code

    def initialize(user_params)
      @login = user_params[:login]
      @password = user_params[:password]
      @password_confirmation = user_params[:password_confirmation]
      @country_code = user_params[:country_code]
    end

    def perform
      return login_user unless password_confirmation.present?

      create_user
    end

    private

    def login_user
      user = UserServices::LoginInputFormatter.new(login, country_code).find_user
      return nil, I18n.t('devise.invalid_login') unless user.valid_password?(password)

      [user, nil]
    end

    def create_user
      return nil, I18n.t('devise.password_mismatch') unless password == password_confirmation

      user = if UserServices::LoginInputFormatter(login).valid_email_format?
               User.create(email: login, password: password, password_confirmation: password_confirmation)
             else
               phone_number = UserServices::LoginInputFormatter(login, country_code).format_phone_number
               User.create(phone_number: phone_number, password: password, password_confirmation: password_confirmation)
             end

      [user, nil]
    end
  end
end