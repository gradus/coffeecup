cc = require '../lib/coffeecup'

#describe 'Escaping', ->
  #describe "h1 h(\"<script>alert('\\\"pwned\\\" by c&a &copy;')</script>\")", ->
    #it "should render <h1>&lt;script&gt;alert('&quot;pwned&quot; by c&amp;a &amp;copy;')&lt;/script&gt;</h1>", ->
      #t = -> h1 'h(\"<script>alert('\\\"owned\\\" by c&a &copy;')</script>")'
      #cc.render(t).should.equal "<h1>&lt;script&gt;alert('&quot;pwned&quot; by c&amp;a &amp;copy;')&lt;/script&gt;</h1>"

