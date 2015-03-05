describe '__super__', () ->

  #require 'kosher/suites/mixto'

describe '__mixins__', () ->

  require 'kosher/suites/emissary/emitter'

  require 'a-event-property/spec/specs/main'

  require 'a-event-methods/spec/specs/main'

  require 'a-event-namespace/spec/specs/main'

require resolve __dirname, 'main'
