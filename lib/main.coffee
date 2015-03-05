Mixto = require 'mixto'

{ Emitter } = require 'emissary'

AEventProperty = require 'a-event-property'

AEventMethods = require 'a-event-methods'

AEventNamespace = require 'a-event-namespace'

class AEventEmitter extends Mixto

  constructor: (@options={}) ->

    super @options

  extended: () ->

    _mixins = () =>

      Emitter.extend @

      AEventProperty.extend @

      AEventMethods.extend @

      AEventNamespace.extend @

    _properties = () =>

      _options = () =>

        @options ?= {}

        @options.eventEmitterEnabled ?= @eventEmitterEnabled or false

      _enabled = () =>

        enabled = @options.eventEmitterEnabled

        Object.defineProperty @, "enabled",

          get: () -> return enabled

          set: (value) ->

            value = !!value

            if enabled is value then return null

            enabled = value

            if enabled then return @enable()

            return @disable()

      _options()

      _enabled()

    _methods = () =>

      @enable = () =>

        if eventListeners = @options.eventListeners

          for name, listeners of eventListeners

            for e in listeners

              @[e.enable].apply @, e.args

          @emit "emitter-enabled"

      @disable = () =>

        @emit "emitter-disabled"

        if eventListeners = @options.eventListeners

          for name, listeners of eventListeners

            for e in listeners then @[e.disable].apply @, e.args

    _extended = () =>

      _mixins()

      _methods()

      _properties()

    _extended()

module.exports = AEventEmitter
