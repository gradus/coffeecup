cc = require '../lib/coffeecup'
assert = require 'assert'
#urlset url loc lastmod changefreq priority
describe 'xml sitemap elements', ->
  describe 'urlset', ->
    it 'urlset', ->
      v = -> urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9"
      assert.equal cc.render(v), '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"></urlset>'
  describe 'url', ->
    it 'url', ->
      v = -> url ->
      assert.equal cc.render(v), '<url></url>'
  describe 'loc', ->
    it 'loc "http://foobar.com/foo"', ->
      v = -> loc 'http://foobar.com/foo'
      assert.equal cc.render(v), '<loc>http://foobar.com/foo</loc>'
  describe 'lastmod', ->
    it 'lastmod "2013-04-12T16:19:02+00:00"', ->
      v = -> lastmod '2013-04-12T16:19:02+00:00'
      assert.equal cc.render(v), '<lastmod>2013-04-12T16:19:02+00:00</lastmod>'
  describe 'changefreq', ->
    it 'changefreq "weekly"', ->
      v = -> changefreq 'weekly'
      assert.equal cc.render(v), '<changefreq>weekly</changefreq>'
  describe 'priority', ->
    it 'priority "0.5"', ->
      v = -> priority '0.5'
      assert.equal cc.render(v), '<priority>0.5</priority>'
