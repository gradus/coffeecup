cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'custom', ->
  describe '#tag(name, attr)', ->
    it 'should render', ->
      t = -> tag 'custom'
      assert.equal cc.render(t), '<custom></custom>'
    it 'should render with attributes', ->
      t = -> tag 'custom', foo: 'bar', ping: 'pong'
      assert.equal cc.render(t), '<custom foo="bar" ping="pong"></custom>'
    it 'should render with attributes and inner attributes', ->
      t = -> tag 'custom', foo: 'bar', ping: 'pong', -> 'zag'
      assert.equal cc.render(t), '<custom foo="bar" ping="pong">zag</custom>'

describe 'custom optimized', ->
  describe '#tag(name, attr)', ->
    it 'should render', ->
      t = -> tag 'custom'
      assert.equal cc.render(t, optimized: true, cache: on), '<custom></custom>'
    it 'should render with attributes', ->
      t = -> tag 'custom', foo: 'bar', ping: 'pong'
      assert.equal cc.render(t, optimized: true, cache: on), '<custom foo="bar" ping="pong"></custom>'
    it 'should render with attributes and inner attributes', ->
      t = -> tag 'custom', foo: 'bar', ping: 'pong', -> 'zag'
      assert.equal cc.render(t, optimized: true, cache: on), '<custom foo="bar" ping="pong">zag</custom>'
