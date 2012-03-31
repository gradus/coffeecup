var Widget, resourceful;

resourceful = require('resourceful');

module.exports = Widget = resourceful.define('widget');

Widget.create({
  name: 'FooBar'
});
