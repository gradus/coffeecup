flatiron = require 'flatiron'
creamer = require 'creamer'
ecstatic = require 'ecstatic'

app = flatiron.app

app.use flatiron.plugins.http
app.use creamer, 
  views: __dirname + '/views'
  controllers: __dirname + '/controllers'
  layout: require __dirname + '/views/layout'

app.http.before = [
  ecstatic __dirname + '/../public', autoIndex: off, cache: on
]

app.router.get '/', -> 
  @res.html @bind('index', { home: '.active' })

app.router.get '/about', ->
  @res.html @bind('about', about: '.active')

app.start 3000, -> console.log 'running...'
