cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'Inline', ->
  describe '#cede(name, attr)', ->
    it 'should render', ->
      t = -> p "This text could use #{cede -> strong -> a href: '/', 'a link'}."
      assert.equal cc.render(t), '<p>This text could use <strong><a href="/">a link</a></strong>.</p>'

describe 'Inline optimized', ->
  describe '#cede(name, attr)', ->
    it 'should render', ->
      t = -> p "This text could use #{cede -> strong -> a href: '/', 'a link'}."
      assert.equal cc.render(t, optimized: true, cache: on), '<p>This text could use <strong><a href="/">a link</a></strong>.</p>'
