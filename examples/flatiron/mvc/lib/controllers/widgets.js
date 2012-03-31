var Widget;

Widget = require(__dirname + '/../models/widget');

module.exports = {
  '/widgets': {
    get: function() {
      var _this = this;
      return Widget.all(function(err, widgets) {
        return _this.res.html(_this.bind('widgets/index', {
          widgets: '.active',
          widgets: widgets
        }));
      });
    }
  }
};
