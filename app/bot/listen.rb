# require 'facebook/messenger'
#
# include Facebook::Messenger
#
# class Listener
#   def self.access_token
#     Rails.application.credentials.dig(:facebook_messenger, :access_token)
#   end
#
#   Facebook::Messenger::Subscriptions.subscribe(
#     access_token: access_token,
#     subscribed_fields: %w[messages messaging_postbacks messaging_optins message_deliveries message_reads]
#   )
#
#   Bot.on :message do |message|
#     Bot.deliver({
#                     recipient: message.sender,
#                     message: {
#                         text: 'Uploading your message to skynet.'
#                     }
#                 }, access_token: access_token)
#   end
# end
#
include Facebook::Messenger

def self.access_token
  Rails.application.credentials.dig(:facebook_messenger, :access_token)
end

Facebook::Messenger::Subscriptions.subscribe(
  access_token: access_token,
  subscribed_fields: %w[messages messaging_postbacks messaging_optins]
)

Bot.on :message do |message|

  Bot.deliver({
                  recipient: message.sender,
                  message: {
                      text: 'nice'
                  }
              }, access_token: access_token)
end
#
# Bot.on :message do |message|
#   message.reply(text: 'Hello, human!')
# end