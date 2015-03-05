kosher.alias 'AEventEmitter'

class AEmitter

  constructor: () ->

    kosher.AEventEmitter.extend @

class A extends AEmitter

  events:

    "event": () ->

  "event?": () ->

module.exports =

  "A": A
