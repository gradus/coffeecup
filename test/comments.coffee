cc = require '../lib/coffeecup'

describe 'Comments', ->
  describe 'comment "Comment"', ->
    it 'should render <!--Comment-->', ->
      c = -> comment "Comment"
      cc.render(c).should.equal '<!--Comment-->'

describe 'Comments optimized', ->
  describe 'comment "Comment"', ->
    it 'should render <!--Comment-->', ->
      c = -> comment "Comment"
      cc.render(c, optimized: true, cache: on).should.equal '<!--Comment-->'
