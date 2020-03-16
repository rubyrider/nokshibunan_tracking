class Facebook::WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  HUB_VERIFY_TOKEN = 'hub.verify_token'.freeze
  HUB_CHALLENGE = 'hub.challenge'.freeze

  def index
    return head :bad_request if params[HUB_VERIFY_TOKEN] != webhook_verify_key

    render plain: params[HUB_CHALLENGE]
  end

  def create
    params['entry'.freeze].each do |entry|
      ReceiveMessage.new(params).perform if entry['messaging'.freeze]
    end
  end

  private

  def webhook_verify_key
    Rails.application.credentials.dig(:facebook_messenger, :webhook_verify_key)
  end
end
