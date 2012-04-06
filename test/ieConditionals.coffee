cc = require '../lib/coffeecup'

describe 'IE conditionals', ->
  describe " ie 'gte IE8', -> link href: 'ie.css', rel: 'stylesheet'", ->
    it 'should render <!--[if gte IE8]><link href="ie.css" rel="stylesheet" /><![endif]-->', ->
      h = -> ie 'gte IE8', -> link href: 'ie.css', rel: 'stylesheet'
      cc.render(h).should.equal '<!--[if gte IE8]><link href="ie.css" rel="stylesheet" /><![endif]-->'

describe 'IE conditionals optimized', ->
  describe " ie 'gte IE8', -> link href: 'ie.css', rel: 'stylesheet'", ->
    it 'should render <!--[if gte IE8]><link href="ie.css" rel="stylesheet" /><![endif]-->', ->
      h = -> ie 'gte IE8', -> link href: 'ie.css', rel: 'stylesheet'
      cc.render(h, optimized: true, cache: on).should.equal '<!--[if gte IE8]><link href="ie.css" rel="stylesheet" /><![endif]-->'
