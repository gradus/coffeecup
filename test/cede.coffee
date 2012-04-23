cc = require '../lib/coffeecup'

describe 'cede', ->
  describe 'p "This text could use \#{cede strong -> a href: \'/\', \'a link\'}."', ->
    it 'should render <p>This text could use <strong><a href="/">a link</a></strong>.</p>', ->
      t = -> p "This text could use #{cede -> strong -> a href: '/', 'a link'}."
      cc.render(t).should.equal '<p>This text could use <strong><a href="/">a link</a></strong>.</p>'

describe 'cede optimized', ->
  describe 'p "This text could use \#{cede -> strong -> a href: \'/\', \'a link\'}."', ->
    it 'should render <p>This text could use <strong><a href="/">a link</a></strong>.</p>', ->
      t = -> p "This text could use #{cede -> strong -> a href: '/', 'a link'}."
      cc.render(t, optimized: true, cache: on).should.equal '<p>This text could use <strong><a href="/">a link</a></strong>.</p>'
