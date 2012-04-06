cc = require '../lib/coffeecup'

describe 'Common tag', ->
  describe "p 'foo'", ->
    it 'should render foo in <p> tag', ->
      p = -> p 'foo'
      cc.render(p).should.equal '<p>foo</p>'

describe 'Common tag optimized', ->
  describe "p 'foo'", ->
    it 'should render foo in <p> tag', ->
      p = -> p 'foo'
      cc.render(p, optimized: true, cache: on).should.equal '<p>foo</p>'
