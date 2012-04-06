cc = require '../lib/coffeecup'

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
      cc.render(h).should.equal '<script>$(document).ready(function(){\n  alert(\'test\');\n});</script>'

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
      cc.render(h, optimized: true, cache: on).should.equal '<script>$(document).ready(function(){\n  alert(\'test\');\n});</script>'
