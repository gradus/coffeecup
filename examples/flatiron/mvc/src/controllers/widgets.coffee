Widget = require __dirname + '/../models/widget'

module.exports = 
  '/widgets':
    get: ->
      Widget.all (err, widgets) =>
        @res.html @bind('widgets/index', { widgets: '.active', widgets: widgets } )
