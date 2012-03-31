cc = require '../lib/coffeecup'

describe 'Attributes', ->
  describe "a href: '/', title: 'Home'", ->
    it 'should render <a href="/" title="Home"></a>', ->
      a = -> a href: '/', title: 'Home'
      cc.render(a).should.equal '<a href="/" title="Home"></a>'
