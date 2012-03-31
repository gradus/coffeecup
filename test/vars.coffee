cc = require '../lib/coffeecup'

describe 'Context vars', ->
  describe 'h1 @foo', ->
    it 'should render <h1>bar</h1>', ->
      v = -> h1 @foo
      cc.render(v, foo: 'bar').should.equal '<h1>bar</h1>'

describe 'Local vars, hardcoded', ->
  describe 'h1 "harcoded: " + obj.foo', ->
    it 'should render <h1>harcoded: bar</h1>', ->
      obj = {foo: 'bar'}
      v = -> h1 "harcoded: " + obj.foo
      expected = '<h1>harcoded: bar</h1>'
      compiled = cc.compile(v, hardcode: {obj})
      result = compiled()
      result.should.equal expected
      obj.foo = 'baz'
      result = compiled()
      result.should.equal expected
