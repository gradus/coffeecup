cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'Comments', ->
  describe 'comment "Comment"', ->
    it 'should render <!--Comment-->', ->
      c = -> comment "Comment"
      assert.equal cc.render(c), '<!--Comment-->'

describe 'Comments optimized', ->
  describe 'comment "Comment"', ->
    it 'should render <!--Comment-->', ->
      c = -> comment "Comment"
      assert.equal cc.render(c, optimized: true, cache: on), '<!--Comment-->'
