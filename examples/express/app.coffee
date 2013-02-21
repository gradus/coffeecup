express = require 'express'
app = express()

coffeecup = require '../../src/coffeecup'

app.set('view engine', 'coffee')
app.engine 'coffee', require('coffeecup').__express

app.get '/', (req, res) ->
  res.render 'index'

app.get '/login', (req, res) ->
  res.render 'login', foo: 'bar', locals: {ping: 'pong'}

app.get '/inline', (req, res) ->
  res.send coffeecup.render ->
    h1 'This is an inline template.'

app.listen 3000

console.log "Listening on 3000..."
