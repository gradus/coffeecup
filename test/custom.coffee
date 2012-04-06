cc = require '../lib/coffeecup'

describe 'custom', ->
  describe '#tag(name, attr)', ->
    it 'should render', ->
      t = -> tag 'custom'
      cc.render(t).should.equal '<custom></custom>'
    it 'should render with attributes', ->
      t = -> tag 'custom', foo: 'bar', ping: 'pong'
      cc.render(t).should.equal '<custom foo="bar" ping="pong"></custom>'
    it 'should render with attributes and inner attributes', ->
      t = -> tag 'custom', foo: 'bar', ping: 'pong', -> 'zag'
      cc.render(t).should.equal '<custom foo="bar" ping="pong">zag</custom>'

describe 'custom optimized', ->
  describe '#tag(name, attr)', ->
    it 'should render', ->
      t = -> tag 'custom'
      cc.render(t, optimized: true, cache: on).should.equal '<custom></custom>'
    it 'should render with attributes', ->
      t = -> tag 'custom', foo: 'bar', ping: 'pong'
      cc.render(t, optimized: true, cache: on).should.equal '<custom foo="bar" ping="pong"></custom>'
    it 'should render with attributes and inner attributes', ->
      t = -> tag 'custom', foo: 'bar', ping: 'pong', -> 'zag'
      cc.render(t, optimized: true, cache: on).should.equal '<custom foo="bar" ping="pong">zag</custom>'
