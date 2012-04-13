cc = require '../lib/coffeecup'

describe 'Stylus', ->
  describe 'stylus  "html, body\\n  margin: 0"', ->
    it 'should render <style>html,body{margin:0}\\n</style>', ->
      s = -> stylus "html, body\n  margin: 0"
      cc.render(s).should.equal "<style>html,body{margin:0}\n</style>"

describe 'Stylus optimized', ->
  describe 'stylus  "html, body\\n  margin: 0"', ->
    it 'should render <style>html,body{margin:0}\\n</style>', ->
      s = -> stylus "html, body\n  margin: 0"
      cc.render(s, optimized: true, cache: on)
        .should.equal "<style>html,body{margin:0}\n</style>"
