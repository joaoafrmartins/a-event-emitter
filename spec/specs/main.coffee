describe 'AEventEmitter', () ->

  it 'before', () ->

    kosher.alias 'fixture', kosher.spec.fixtures.emitters

    kosher.alias 'instance', new kosher.fixture.A

  describe 'properties', () ->

    it 'before', () ->

      kosher.properties(

        { name: "enabled", type: "boolean", value: false}

      )

    describe 'enabled', () ->

      it "should enable all event listeners when set to true", () ->

        expect(kosher.instance.subscriptionCounts).to.be.null

        kosher.instance.enabled = true

        kosher.instance.subscriptionCounts.event.should.eql 2

      it "should disable all event listeners when set to false", () ->

        kosher.instance.enabled = false

        kosher.instance.subscriptionCounts.should.eql {}

  describe 'methods', () ->

    it 'before', () ->

    describe 'enable', () ->

    describe 'disable', () ->
