meryl = require 'meryl'
coffeecup = require '../../src/coffeecup'

meryl.h 'GET /', (req, resp) ->
  people = ['bob', 'alice', 'meryl']
  resp.render 'layout', content: 'index', context: {people: people}

meryl.run
  templateDir: 'templates'
  templateExt: '.coffee'
  templateFunc: coffeecup.adapters.meryl

console.log 'Listening on 3000...'
