cc = require '../lib/coffeecup'

describe 'Context vars', ->
  describe 'h1 @foo', ->
    it 'should render <h1>bar</h1>', ->
      v = -> h1 @foo
      cc.render(v, foo: 'bar').should.equal '<h1>bar</h1>'

describe 'Local vars', ->
  describe 'h1 "dynamic: " + obj.foo', ->
    it 'should render <h1>dynamic: bar</h1>', ->
      obj = {foo: 'bar'}
      v = -> h1 "dynamic: " + obj.foo
      cc.render(v, locals: {obj: obj}).should.equal '<h1>dynamic: bar</h1>'
      obj.foo = 'baz'
      cc.render(v, locals: {obj: obj}).should.equal '<h1>dynamic: baz</h1>'

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

describe 'Context vars optimized', ->
  describe 'h1 @foo', ->
    it 'should render <h1>bar</h1>', ->
      v = -> h1 @foo
      cc.render(v, optimized: true, foo: 'bar', cache: on).should.equal '<h1>bar</h1>'

describe 'Local vars optimized', ->
  describe 'h1 "dynamic: " + obj.foo', ->
    it 'should render <h1>dynamic: bar</h1>', ->
      obj = {foo: 'bar'}
      v = -> h1 "dynamic: " + obj.foo
      cc.render(v, optimized: true, locals: {obj: obj, cache: on}).should.equal '<h1>dynamic: bar</h1>'
      obj.foo = 'baz'
      cc.render(v, optimized: true, locals: {obj: obj}, cache: on).should.equal '<h1>dynamic: baz</h1>'

describe 'Local vars, hardcoded optimized', ->
  describe 'h1 "harcoded: " + obj.foo', ->
    it 'should render <h1>harcoded: bar</h1>', ->
      obj = {foo: 'bar'}
      v = -> h1 "harcoded: " + obj.foo
      expected = '<h1>harcoded: bar</h1>'
      compiled = cc.compile(v, optimized: true, hardcode: {obj, cache: on})
      result = compiled()
      result.should.equal expected
      obj.foo = 'baz'
      result = compiled()
      result.should.equal expected
