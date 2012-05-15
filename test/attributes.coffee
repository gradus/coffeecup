cc = require '../lib/coffeecup'

describe 'Attributes', ->
  describe "a href: '/', title: 'Home'", ->
    it 'should render <a href="/" title="Home"></a>', ->
      a = -> a href: '/', title: 'Home'
      cc.render(a).should.equal '<a href="/" title="Home"></a>'

describe 'Attribute values', ->
  describe "br vrai: yes, faux: no, undef: @foo, nil: null, str: 'str', num: 42, arr: [1, 2, 3], obj: {foo: 'bar'}, func: ->", ->
    it 'should render <br vrai="vrai" str="str" num="42" arr="1,2,3" obj-foo="bar" func="(function () {}).call(this);" />', ->
      a = -> br vrai: yes, faux: no, undef: @foo, nil: null, str: 'str', num: 42, arr: [1, 2, 3], obj: {foo: 'bar'}, func: ->
      cc.render(a).should.equal '<br vrai="vrai" str="str" num="42" arr="1,2,3" obj-foo="bar" func="(function () {}).call(this);" />'
      
describe 'Inline attributes', ->
  describe "p '#foo {{bindAttr class=isSelected}}, 'Bar'", ->
    a = -> p '#foo {{bindAttr class="isSelected"}}', 'Bar'
    cc.render(a).should.equal '<p id="foo" {{bindAttr class="isSelected"}}>Bar</p>'
      
  describe "p '{{bindAttr class=isActive target=App}}, 'Bar'", ->
    a = -> p '{{bindAttr class="isActive" target="App"}}', 'Bar'
    cc.render(a).should.equal '<p {{bindAttr class="isActive" target="App"}}>Bar</p>'

describe 'Attributes optimized', ->
  describe "a href: '/', title: 'Home'", ->
    it 'should render <a href="/" title="Home"></a>', ->
      a = -> a href: '/', title: 'Home'
      cc.render(a, optimize: true, cache: on).should.equal '<a href="/" title="Home"></a>'

describe 'Attribute values optimized', ->
  describe "br vrai: yes, faux: no, undef: @foo, nil: null, str: 'str', num: 42, arr: [1, 2, 3], obj: {foo: 'bar'}, func: ->", ->
    it 'should render <br vrai="vrai" str="str" num="42" arr="1,2,3" obj-foo="bar" func="(function () {}).call(this);" />', ->
      a = -> br vrai: yes, faux: no, undef: @foo, nil: null, str: 'str', num: 42, arr: [1, 2, 3], obj: {foo: 'bar'}, func: ->
      cc.render(a, optimize: true).should.equal '<br vrai="vrai" str="str" num="42" arr="1,2,3" obj-foo="bar" func="(function () {}).call(this);" />'
