root = exports ? this

if Meteor.isClient
  Meteor.startup ->
    updatePhase()
    Meteor.setInterval(updatePhase, 720000)

  Template.index.phase_image = ->
    currentPhase = Session.get 'current_phase'
    return "images/moonphase#{currentPhase}.png"

if Meteor.isServer
  Meteor.startup ->
    # code to run on server at startup

root.updatePhase = ->
  root.calc or= new MoonPhase.Calculator()
  currentPhase = calc.getAdjustedMoonPhase new Date()
  Session.set 'current_phase', currentPhase