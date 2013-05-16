{ Adapter } = require '/Users/whz/Projects/Node/a-hubot/node_modules/hubot'

Conversation = require 'hubot-conversation'

class ExtendedAdapter extends Adapter
  # Extend the built-in Adapter module
  #
  # robot - A Robot instance.
  constructor: (@robot) ->
    super @robot

    @robot.brain.volatile_data = conversations: {}

    @flags = data_loaded : false

  # Public:
  extend_user_property: (user_id, options) ->
    user = @robot.brain.data.users[user_id]
    if user
      extend user, options

  # Public:
  user_conversation: (user_id, message, options) ->
    conversation = @robot.brain.volatile_data.conversations[user_id]

    unless conversation?
      conversation = new Conversation user_id, options
      @robot.brain.volatile_data.conversations[user_id] = conversation

    conversation.push user_id, message

    conversation

  receive: (message) ->
    @user_conversation(message.user.id, message.text) if message.text isnt ""

    @robot.receive message

# Private: Extend obj with objects passed as additional args.
#
# Returns the original object with updated changes.
extend = (obj, sources...) ->
  for source in sources
    obj[key] = value for own key, value of source
  obj

module.exports = ExtendedAdapter