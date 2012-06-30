cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'Self Closing Tags', ->
  describe '#img(name, attr)', ->
    it 'should render', ->
      t = -> img()
      assert.equal cc.render(t), '<img />'
    it 'should render with attributes', ->
      t = -> img src: 'http://foo.jpg.to'
      assert.equal cc.render(t), '<img src="http://foo.jpg.to" />'
  describe '#br()', ->
    it 'should render', ->
      t = -> br()
      assert.equal cc.render(t), '<br />'
  describe '#link()', ->
    it 'should render with attributes', ->
      t = -> link href: '/foo.css', rel: 'stylesheet'
      assert.equal cc.render(t), '<link href="/foo.css" rel="stylesheet" />'

describe 'Self Closing Tags optimized', ->
  describe '#img(name, attr)', ->
    it 'should render', ->
      t = -> img()
      assert.equal cc.render(t, optimized: true, cache: on), '<img />'
    it 'should render with attributes', ->
      t = -> img src: 'http://foo.jpg.to'
      assert.equal cc.render(t), '<img src="http://foo.jpg.to" />'
  describe '#br()', ->
    it 'should render', ->
      t = -> br()
      assert.equal cc.render(t, optimized: true, cache: on), '<br />'
  describe '#link()', ->
    it 'should render with attributes', ->
      t = -> link href: '/foo.css', rel: 'stylesheet'
      assert.equal cc.render(t, optimized: true, cache: on), '<link href="/foo.css" rel="stylesheet" />'
