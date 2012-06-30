cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'Stylus', ->
  describe 'stylus  "html, body\\n  margin: 0"', ->
    it 'should render <style>html,body{margin:0}\\n</style>', ->
      s = -> stylus "html, body\n  margin: 0"
      assert.equal cc.render(s), "<style>html,body{margin:0}\n</style>"

describe 'Stylus optimized', ->
  describe 'stylus  "html, body\\n  margin: 0"', ->
    it 'should render <style>html,body{margin:0}\\n</style>', ->
      s = -> stylus "html, body\n  margin: 0"
      assert.equal cc.render(s, optimized: true, cache: on), "<style>html,body{margin:0}\n</style>"
