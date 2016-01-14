if Meteor.isServer
  Meteor.methods
    set: (value) ->
      @connection.test = value

    log: ->
      console.log @connection

if Meteor.isClient
  Meteor.startup ->
    Meteor.call 'set', 5
    Meteor.call 'log'

    setTimeout ->
      Meteor.call 'log'
    , 1000

    setTimeout ->
      Meteor.call 'log'
    , 10 * 1000
