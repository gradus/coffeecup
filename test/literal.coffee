cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'literal', ->
  describe '#text(value)', ->
    it 'should render just plain text', ->
      t = -> text 'foobar'
      assert.equal cc.render(t), 'foobar'

describe 'literal optimized', ->
  describe '#text(value)', ->
    it 'should render just plain text', ->
      t = -> text 'foobar'
      assert.equal cc.render(t, optimized: true, cache: on), 'foobar'
