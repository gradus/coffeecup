cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'Context vars', ->
  describe 'h1 @foo', ->
    it 'should render <h1>bar</h1>', ->
      v = -> h1 @foo
      assert.equal cc.render(v, foo: 'bar'), '<h1>bar</h1>'

describe 'Local vars', ->
  describe 'h1 "dynamic: " + obj.foo', ->
    it 'should render <h1>dynamic: bar</h1>', ->
      obj = {foo: 'bar'}
      v = -> h1 "dynamic: " + obj.foo
      assert.equal cc.render(v, locals: {obj: obj}), '<h1>dynamic: bar</h1>'
      obj.foo = 'baz'
      assert.equal cc.render(v, locals: {obj: obj}), '<h1>dynamic: baz</h1>'

describe 'Local vars, hardcoded', ->
  describe 'h1 "harcoded: " + obj.foo', ->
    it 'should render <h1>harcoded: bar</h1>', ->
      obj = {foo: 'bar'}
      v = -> h1 "harcoded: " + obj.foo
      expected = '<h1>harcoded: bar</h1>'
      compiled = cc.compile(v, hardcode: {obj})
      result = compiled()
      assert.equal result, expected
      obj.foo = 'baz'
      result = compiled()
      assert.equal result, expected

describe 'Context vars optimized', ->
  describe 'h1 @foo', ->
    it 'should render <h1>bar</h1>', ->
      v = -> h1 @foo
      assert.equal cc.render(v, optimized: true, foo: 'bar', cache: on), '<h1>bar</h1>'

describe 'Local vars optimized', ->
  describe 'h1 "dynamic: " + obj.foo', ->
    it 'should render <h1>dynamic: bar</h1>', ->
      obj = {foo: 'bar'}
      v = -> h1 "dynamic: " + obj.foo
      assert.equal cc.render(v, optimized: true, locals: {obj: obj, cache: on}), '<h1>dynamic: bar</h1>'
      obj.foo = 'baz'
      assert.equal cc.render(v, optimized: true, locals: {obj: obj}, cache: on), '<h1>dynamic: baz</h1>'

describe 'Local vars, hardcoded optimized', ->
  describe 'h1 "harcoded: " + obj.foo', ->
    it 'should render <h1>harcoded: bar</h1>', ->
      obj = {foo: 'bar'}
      v = -> h1 "harcoded: " + obj.foo
      expected = '<h1>harcoded: bar</h1>'
      compiled = cc.compile(v, optimized: true, hardcode: {obj, cache: on})
      result = compiled()
      assert.equal result, expected
      obj.foo = 'baz'
      result = compiled()
      assert.equal result, expected
