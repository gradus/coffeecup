cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'CoffeeScript helper (function)', ->
  describe "coffeescript -> alert 'hi'",  ->
    coffeescript_helper = """
var __slice = Array.prototype.slice;
var __hasProp = Object.prototype.hasOwnProperty;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
var __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype;
  return child; };
var __indexOf = Array.prototype.indexOf || function(item) {
  for (var i = 0, l = this.length; i < l; i++) {
    if (this[i] === item) return i;
  } return -1; };
    """.replace /\n/g, ''
    it "should render <script>#{coffeescript_helper}(function () {\n return alert('hi');\n }).call(this);</script>", ->
      h = -> coffeescript -> alert 'hi'
      assert.equal cc.render(h), "<script>#{coffeescript_helper}(function () {\n            return alert('hi');\n          }).call(this);</script>"

describe 'CoffeeScript helper (string)', ->
  describe 'coffeescript "alert \'hi\'\"',  ->
    it 'should render <script type="text/coffeescript">alert \'hi\'</script>', ->
      h = -> coffeescript "alert 'hi'"
      assert.equal cc.render(h), '<script type="text/coffeescript">alert \'hi\'</script>'

describe 'CoffeeScript helper (object)', ->
  describe "coffeescript src: 'script.coffee'",  ->
    it 'should render <script src="script.coffee" type="text/coffeescript"></script>', ->
      h = -> coffeescript src: 'script.coffee'
      assert.equal cc.render(h), '<script src="script.coffee" type="text/coffeescript"></script>'

describe 'CoffeeScript helper (function) optimized', ->
  describe "coffeescript -> alert 'hi'",  ->
    coffeescript_helper = """
var __slice = Array.prototype.slice;
var __hasProp = Object.prototype.hasOwnProperty;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
var __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype;
  return child; };
var __indexOf = Array.prototype.indexOf || function(item) {
  for (var i = 0, l = this.length; i < l; i++) {
    if (this[i] === item) return i;
  } return -1; };
    """.replace /\n/g, ''
    it "should render <script>#{coffeescript_helper}(function () {\n return alert('hi');\n }).call(this);</script>", ->
      h = -> coffeescript -> alert 'hi'
      assert.equal cc.render(h, optimized: true), "<script>#{coffeescript_helper}(function () {\n            return alert('hi');\n          }).call(this);</script>"

describe 'CoffeeScript helper (string) optimized', ->
  describe 'coffeescript "alert \'hi\'\"',  ->
    it 'should render <script type="text/coffeescript">alert \'hi\'</script>', ->
      h = -> coffeescript "alert 'hi'"
      assert.equal cc.render(h, optimized: true), '<script type="text/coffeescript">alert \'hi\'</script>'

describe 'CoffeeScript helper (object) optimized', ->
  describe "coffeescript src: 'script.coffee'",  ->
    it 'should render <script src="script.coffee" type="text/coffeescript"></script>', ->
      h = -> coffeescript src: 'script.coffee'
      assert.equal cc.render(h, optimized: true), '<script src="script.coffee" type="text/coffeescript"></script>'


