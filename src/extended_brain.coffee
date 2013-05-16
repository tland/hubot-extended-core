{ Brain } = require '/Users/whz/Projects/Node/a-hubot/node_modules/hubot'

class ExtendedBrain extends Brain
  # Represents a conversation with a participating user in the chat.
  #
  # id      - A unique ID for the user.
  # options - An optional Hash of key, value pairs for this user.
  constructor: ->

module.exports = ExtendedBrain