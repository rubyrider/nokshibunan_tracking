class ConfigurationProvider < Facebook::Messenger::Configuration::Providers::Base
  def valid_verify_token?(verify_token)
    verify_token == Rails.application.credentials.dig(:facebook_messenger, :webhook_verify_key)
  end

  def app_secret_for(page_id)
    Rails.application.credentials.dig(:facebook_messenger, :page_id)
  end

  def access_token_for(recipient)
    Rails.application.credentials.dig(:facebook_messenger, :access_token)
  end
end