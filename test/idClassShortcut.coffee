cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'ID/class shortcut (ID only)', ->
  describe "div '#myid', 'foo'", ->
    it 'should render <div id="myid">foo</div>', ->
      t = -> div '#myid', 'foo'
      assert.equal cc.render(t), '<div id="myid">foo</div>'

describe 'ID/class shortcut (one class only)', ->
  describe "div '.myclass', 'foo'", ->
    it 'should render <div class="myclass">foo</div>', ->
      t = -> div '.myclass', 'foo'
      assert.equal cc.render(t), '<div class="myclass">foo</div>'

describe 'ID/class shortcut (multiple classes)', ->
  describe "div '.myclass.myclass2.myclass3', 'foo'", ->
    it 'should render <div class="myclass myclass2 myclass3">foo</div>', ->
      t = -> div '.myclass.myclass2.myclass3', 'foo'
      assert.equal cc.render(t), '<div class="myclass myclass2 myclass3">foo</div>'

describe 'ID/class shortcut (no string contents)', ->
  describe "img '#myid.myclass', src: '/pic.png'", ->
    it 'should render <img id="myid" class="myclass" src="/pic.png" />', ->
      t = -> img '#myid.myclass', src: '/pic.png'
      assert.equal cc.render(t), '<img id="myid" class="myclass" src="/pic.png" />'

describe 'ID/class shortcut (ID only) optimized', ->
  describe "div '#myid', 'foo'", ->
    it 'should render <div id="myid">foo</div>', ->
      t = -> div '#myid', 'foo'
      assert.equal cc.render(t, optimized: true, cache: on), '<div id="myid">foo</div>'

describe 'ID/class shortcut (one class only) optimized', ->
  describe "div '.myclass', 'foo'", ->
    it 'should render <div class="myclass">foo</div>', ->
      t = -> div '.myclass', 'foo'
      assert.equal cc.render(t, optimized: true, cache: on), '<div class="myclass">foo</div>'

describe 'ID/class shortcut (multiple classes) optimized', ->
  describe "div '.myclass.myclass2.myclass3', 'foo'", ->
    it 'should render <div class="myclass myclass2 myclass3">foo</div>', ->
      t = -> div '.myclass.myclass2.myclass3', 'foo'
      assert.equal cc.render(t, optimized: true, cache: on), '<div class="myclass myclass2 myclass3">foo</div>'

describe 'ID/class shortcut (no string contents) optimized', ->
  describe "img '#myid.myclass', src: '/pic.png'", ->
    it 'should render <img id="myid" class="myclass" src="/pic.png" />', ->
      t = -> img '#myid.myclass', src: '/pic.png'
      assert.equal cc.render(t, optimized: true, cache: on), '<img id="myid" class="myclass" src="/pic.png" />'
