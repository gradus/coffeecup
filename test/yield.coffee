cc = require '../lib/coffeecup'

describe 'yield', ->
  describe 'p "This text could use \#{yield -> strong -> a href: \'/\', \'a link\'}."', ->
    it 'should render <p>This text could use <strong><a href="/">a link</a></strong>.</p>', ->
      t = -> p "This text could use #{yield -> strong -> a href: '/', 'a link'}."
      cc.render(t).should.equal '<p>This text could use <strong><a href="/">a link</a></strong>.</p>'
