cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'IE conditionals', ->
  describe " ie 'gte IE8', -> link href: 'ie.css', rel: 'stylesheet'", ->
    it 'should render <!--[if gte IE8]><link href="ie.css" rel="stylesheet" /><![endif]-->', ->
      h = -> ie 'gte IE8', -> link href: 'ie.css', rel: 'stylesheet'
      assert.equal cc.render(h), '<!--[if gte IE8]><link href="ie.css" rel="stylesheet" /><![endif]-->'

describe 'IE conditionals optimized', ->
  describe " ie 'gte IE8', -> link href: 'ie.css', rel: 'stylesheet'", ->
    it 'should render <!--[if gte IE8]><link href="ie.css" rel="stylesheet" /><![endif]-->', ->
      h = -> ie 'gte IE8', -> link href: 'ie.css', rel: 'stylesheet'
      assert.equal cc.render(h, optimized: true, cache: on), '<!--[if gte IE8]><link href="ie.css" rel="stylesheet" /><![endif]-->'
