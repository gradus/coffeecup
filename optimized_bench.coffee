#!/usr/bin/env coffee

coffeecup = require './src/coffeecup'
log = console.log

data =
  title: 'test'
  inspired: no
  users: [
    {email: 'house@gmail.com', name: 'house'}
    {email: 'cuddy@gmail.com', name: 'cuddy'}
    {email: 'wilson@gmail.com', name: 'wilson'}
  ]

coffeecup_template = ->
  doctype 5
  html lang: 'en', ->
    head ->
      meta charset: 'utf-8'
      title @title
      style '''
        body {font-family: "sans-serif"}
        section, header {display: block}
      '''
    body ->
      section ->
        header ->
          h1 @title
        if @inspired
          p 'Create a witty example'
        else
          p 'Go meta'
        ul ->
          for user in @users
            li user.name
            li -> a href: "mailto:#{user.email}", -> user.email

coffeecup_compiled_template = coffeecup.compile coffeecup_template

coffeecup_optimized_template = coffeecup.compile coffeecup_template, optimize: yes

benchmark = (title, code) ->
  start = new Date
  for i in [1..100000]
    code()
  log "#{title}: #{new Date - start} ms"

benchmark 'coffeecup (precompiled)', -> coffeecup_compiled_template data
benchmark 'coffeecup (precompiled, optimized)', -> coffeecup_optimized_template data
