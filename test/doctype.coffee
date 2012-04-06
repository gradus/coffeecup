cc = require '../lib/coffeecup'

describe 'doctype', ->
  it 'default should render html5 doctype', ->
    template = "doctype()"
    expected = '<!DOCTYPE html>'
    cc.render(template).should.equal expected
  it 'xml should render xml header', ->
    template = "doctype 'xml'"
    expected = '<?xml version="1.0" encoding="utf-8" ?>'
    cc.render(template).should.equal expected
  it '5 should render html 5 doctype', ->
    template = "doctype 5"
    expected = '<!DOCTYPE html>'
    cc.render(template).should.equal expected
  it 'transitional should render transitional doctype', ->
    template = "doctype 'transitional'"
    expected = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'
    cc.render(template).should.equal expected

# 'strict': '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'
# 'frameset': '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">'
# '1.1': '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">',
# 'basic': '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN" "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">'
# 'mobile': '<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.2//EN" "http://www.openmobilealliance.org/tech/DTD/xhtml-mobile12.dtd">'
# 'ce': '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "ce-html-1.0-transitional.dtd">'

describe 'doctype optimized', ->
  it 'default should render html5 doctype', ->
    template = "doctype()"
    expected = '<!DOCTYPE html>'
    cc.render(template, optimized: true, cache: on).should.equal expected
  it 'xml should render xml header', ->
    template = "doctype 'xml'"
    expected = '<?xml version="1.0" encoding="utf-8" ?>'
    cc.render(template, optimized: true, cache: on).should.equal expected
  it '5 should render html 5 doctype', ->
    template = "doctype 5"
    expected = '<!DOCTYPE html>'
    cc.render(template, optimized: true, cache: on).should.equal expected
  it 'transitional should render transitional doctype', ->
    template = "doctype 'transitional'"
    expected = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'
    cc.render(template, optimized: true, cache: on).should.equal expected
