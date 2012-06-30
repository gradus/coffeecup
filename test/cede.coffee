cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'cede', ->
  describe 'p "This text could use \#{cede strong -> a href: \'/\', \'a link\'}."', ->
    it 'should render <p>This text could use <strong><a href="/">a link</a></strong>.</p>', ->
      t = -> p "This text could use #{cede -> strong -> a href: '/', 'a link'}."
      assert.equal cc.render(t), '<p>This text could use <strong><a href="/">a link</a></strong>.</p>'

describe 'cede optimized', ->
  describe 'p "This text could use \#{cede -> strong -> a href: \'/\', \'a link\'}."', ->
    it 'should render <p>This text could use <strong><a href="/">a link</a></strong>.</p>', ->
      t = -> p "This text could use #{cede -> strong -> a href: '/', 'a link'}."
      assert.equal cc.render(t, optimized: true, cache: on), '<p>This text could use <strong><a href="/">a link</a></strong>.</p>'
