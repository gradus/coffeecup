cc = require '../lib/coffeecup'

describe 'Self Closing Tags', ->
  describe '#img(name, attr)', ->
    it 'should render', ->
      t = -> img()
      cc.render(t).should.equal '<img />'
    it 'should render with attributes', ->
      t = -> img src: 'http://foo.jpg.to'
      cc.render(t).should.equal '<img src="http://foo.jpg.to" />'
  describe '#br()', ->
    it 'should render', ->
      t = -> br()
      cc.render(t).should.equal '<br />'
  describe '#link()', ->
    it 'should render with attributes', ->
      t = -> link href: '/foo.css', rel: 'stylesheet'
      cc.render(t).should.equal '<link href="/foo.css" rel="stylesheet" />'

describe 'Self Closing Tags optimized', ->
  describe '#img(name, attr)', ->
    it 'should render', ->
      t = -> img()
      cc.render(t, optimized: true, cache: on).should.equal '<img />'
    it 'should render with attributes', ->
      t = -> img src: 'http://foo.jpg.to'
      cc.render(t).should.equal '<img src="http://foo.jpg.to" />'
  describe '#br()', ->
    it 'should render', ->
      t = -> br()
      cc.render(t, optimized: true, cache: on).should.equal '<br />'
  describe '#link()', ->
    it 'should render with attributes', ->
      t = -> link href: '/foo.css', rel: 'stylesheet'
      cc.render(t, optimized: true, cache: on).should.equal '<link href="/foo.css" rel="stylesheet" />'
