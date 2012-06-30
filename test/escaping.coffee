cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'Escaping', ->
  describe "h1 h(\"<script>alert('\"owned\" by c&a &copy;')</script>)", ->
    it "should render <h1>&lt;script&gt;alert('&quot;owned&quot; by c&amp;a &amp;copy;')&lt;/script&gt;</h1>", ->
      t = -> h1 h("<script>alert('\"owned\" by c&a &copy;')</script>")
      assert.equal cc.render(t), "<h1>&lt;script&gt;alert('&quot;owned&quot; by c&amp;a &amp;copy;')&lt;/script&gt;</h1>"

describe 'AutoEscaping', ->
  describe "h1 <script>alert('\"owned\" by c&a &copy;')</script>", ->
    it "should render <h1>&lt;script&gt;alert('&quot;owned&quot; by c&amp;a &amp;copy;')&lt;/script&gt;</h1>", ->
      t = -> h1 "<script>alert('\"owned\" by c&a &copy;')</script>"
      assert.equal cc.render(t, autoescape: yes), "<h1>&lt;script&gt;alert('&quot;owned&quot; by c&amp;a &amp;copy;')&lt;/script&gt;</h1>"

describe 'Escaping optimized', ->
  describe "h1 h(\"<script>alert('\"owned\" by c&a &copy;')</script>)", ->
    it "should render <h1>&lt;script&gt;alert('&quot;owned&quot; by c&amp;a &amp;copy;')&lt;/script&gt;</h1>", ->
      t = -> h1 h("<script>alert('\"owned\" by c&a &copy;')</script>")
      assert.equal cc.render(t, optimized: true, cache: on), "<h1>&lt;script&gt;alert('&quot;owned&quot; by c&amp;a &amp;copy;')&lt;/script&gt;</h1>"

describe 'AutoEscaping optimized', ->
  describe "h1 <script>alert('\"owned\" by c&a &copy;')</script>", ->
    it "should render <h1>&lt;script&gt;alert('&quot;owned&quot; by c&amp;a &amp;copy;')&lt;/script&gt;</h1>", ->
      t = -> h1 "<script>alert('\"owned\" by c&a &copy;')</script>"
      assert.equal cc.render(t, autoescape: yes, optimized: true, cache: on), "<h1>&lt;script&gt;alert('&quot;owned&quot; by c&amp;a &amp;copy;')&lt;/script&gt;</h1>"

