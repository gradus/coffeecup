cc = require '../lib/coffeecup'
assert = require 'assert'

describe 'HereDocs', ->
  describe '''
     script """
        $(document).ready(function(){
          alert('test');
        });
      """
  ''', ->
    it 'should render <script>$(document).ready(function(){\n  alert(\'test\');\n});</script>', ->
      h = -> script """
        $(document).ready(function(){
          alert('test');
        });
      """
      assert.equal cc.render(h), '<script>$(document).ready(function(){\n  alert(\'test\');\n});</script>'

describe 'HereDocs optimized', ->
  describe '''
     script """
        $(document).ready(function(){
          alert('test');
        });
      """
  ''', ->
    it 'should render <script>$(document).ready(function(){\n  alert(\'test\');\n});</script>', ->
      h = -> script """
        $(document).ready(function(){
          alert('test');
        });
      """
      assert.equal cc.render(h, optimized: true, cache: on), '<script>$(document).ready(function(){\n  alert(\'test\');\n});</script>'
