cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'Common tag', ->
  describe "p 'foo'", ->
    it 'should render foo in <p> tag', ->
      p = -> p 'foo'
      assert.equal cc.render(p), '<p>foo</p>'

describe 'Common tag optimized', ->
  describe "p 'foo'", ->
    it 'should render foo in <p> tag', ->
      p = -> p 'foo'
      assert.equal cc.render(p, optimized: true, cache: on), '<p>foo</p>'
