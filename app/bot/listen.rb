require "facebook/messenger"
require "client"
include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
# message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
# message.sender      # => { 'id' => '1008372609250235' }
# message.sent_at     # => 2016-04-22 21:30:36 +0200
# message.text        # => 'Hello, bot!'
Bot.on :message do |message|
  client = Facebook::Client.new
  user_data = client.get_user(message.sender["id"])
  user_name = user_data["first_name"]
  gender = user_data["gender"]
  node = Node.where("question_s = ?", message.text).first
  node = Node.first if !node
  if node.nodes.length > 0
    quick_replies = node.nodes.map do |n|
      {
          content_type: 'text',
          title: n.question_s,
          payload: n.question_s
      }
    end
  else
    quick_replies = []
  end
  message_out = {
    text: "U r at level #{node.name}. #{node.description}"
  }
  message[:quick_replies] = quick_replies if quick_replies.length > 0
  Bot.deliver({
    recipient: message.sender,
    message: message_out
  }, access_token: ENV["ACCESS_TOKEN"])
end
