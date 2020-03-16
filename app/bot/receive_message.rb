class ReceiveMessage

  attr_accessor :body

  def initialize(body)
    @body = parse_body body
  end

  def perform
    check_integrity

    trigger(body)
  end

  private

  def parse_body body
    JSON.parse(body.to_json)
  end

  def check_integrity
    # If app secret is not found in environment, return.
    # So for the security purpose always add provision in
    #   configuration provider to return app secret.
    return unless app_secret_for(body['entry'][0]['id'])

    # unless signature.start_with?('sha1='.freeze)
    #   warn X_HUB_SIGNATURE_MISSING_WARNING
    #
    #   raise BadRequestError, 'Error getting integrity signature'.freeze
    # end

    # raise BadRequestError, 'Error checking message integrity'.freeze \
    #   unless valid_signature?
  end

  def app_secret_for(facebook_page_id)
    Facebook::Messenger.config.provider.app_secret_for(facebook_page_id)
  end

  def signature_for(string)
    format('sha1=%<string>s'.freeze, string: generate_hmac(string))
  end

  # Generate a HMAC signature for the given content.
  def generate_hmac(content)
    content_json = JSON.parse(content, symbolize_names: true)
    facebook_page_id = content_json[:entry][0][:id]

    OpenSSL::HMAC.hexdigest('sha1'.freeze,
                            app_secret_for(facebook_page_id),
                            content)
  end

  def signature
    @request.env['HTTP_X_HUB_SIGNATURE'.freeze].to_s
  end

  def trigger(events)
    events['entry'.freeze].each do |entry|

      next unless entry['messaging'.freeze]

      entry['messaging'.freeze].each do |messaging|
        Facebook::Messenger::Bot.receive(messaging)
      end
    end
  end
end