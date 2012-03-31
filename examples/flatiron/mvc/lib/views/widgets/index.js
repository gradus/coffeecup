
module.exports = function() {
  h1('Widgets');
  return ul(function() {
    var widget, _i, _len, _ref, _results;
    _ref = this.widgets;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      widget = _ref[_i];
      _results.push(li(function() {
        return widget.name;
      }));
    }
    return _results;
  });
};
