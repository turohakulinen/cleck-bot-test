require "facebook/messenger"
include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
# message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
# message.sender      # => { 'id' => '1008372609250235' }
# message.sent_at     # => 2016-04-22 21:30:36 +0200
# message.text        # => 'Hello, bot!'
Bot.on :message do |message|
  client = Facebook::Client.new
  user_data = client.get_user(message.sender["id"])

  p user_data
  user_name = user_data["name"]
  gender = user_data["gender"]
  political = user_data["political"]
  quotes = user_data["quotes"]
  Bot.deliver({
    recipient: message.sender,
    message: {
      text: "Hello #{user_name}, you r #{gender} and belive in #{political}. #{quotes} + fb is scary"
    }
  }, access_token: ENV["ACCESS_TOKEN"])
end
