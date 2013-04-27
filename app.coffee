if Meteor.isClient
  Meteor.startup ->
    # code to run on server at startup

  Template.index.phase_image = ->
    return 'images/moonphase29.png'

if Meteor.isServer
  Meteor.startup ->
    # code to run on server at startup
