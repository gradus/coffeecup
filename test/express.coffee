cc = require '../lib/coffeecup'
assert = require 'assert'
path = require 'path'

describe '__express', ->
  describe 'render', ->
    template = path.join(__dirname, 'templates', 'renderError.coffee')

    it "should callback with any render errors", (done) ->
      cc.__express template, {}, (err, result) ->
        assert.exist(err)
        done()

    it 'should callback with render errors from a cached template', (done) ->
      cc.__express template, {cache: true}, (err, result) ->
        assert.exist(err)
        cc.__express template, {cache: true}, (err, result) ->
          assert.exist(err)
          done()

  describe 'compile', ->
    template = path.join(__dirname, 'templates', 'compileError.coffee')

    it 'should callback with any compile errors', (done) ->
      cc.__express template, {}, (err, result) ->
        assert.exist(err)
        done()

