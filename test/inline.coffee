cc = require '../lib/coffeecup'

describe 'Inline', ->
  describe '#cede(name, attr)', ->
    it 'should render', ->
      t = -> p "This text could use #{cede -> strong -> a href: '/', 'a link'}."
      cc.render(t).should.equal '<p>This text could use <strong><a href="/">a link</a></strong>.</p>'

describe 'Inline optimized', ->
  describe '#cede(name, attr)', ->
    it 'should render', ->
      t = -> p "This text could use #{cede -> strong -> a href: '/', 'a link'}."
      cc.render(t, optimized: true, cache: on).should.equal '<p>This text could use <strong><a href="/">a link</a></strong>.</p>'
