cc = require '../lib/coffeecup'

describe 'Inline', ->
  describe '#yield(name, attr)', ->
    it 'should render', ->
      t = -> p "This text could use #{yield -> strong -> a href: '/', 'a link'}."
      cc.render(t).should.equal '<p>This text could use <strong><a href="/">a link</a></strong>.</p>'

describe 'Inline optimized', ->
  describe '#yield(name, attr)', ->
    it 'should render', ->
      t = -> p "This text could use #{yield -> strong -> a href: '/', 'a link'}."
      cc.render(t, optimized: true, cache: on).should.equal '<p>This text could use <strong><a href="/">a link</a></strong>.</p>'
