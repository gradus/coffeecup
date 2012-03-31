var app, creamer, ecstatic, flatiron;

flatiron = require('flatiron');

creamer = require('creamer');

ecstatic = require('ecstatic');

app = flatiron.app;

app.use(flatiron.plugins.http);

app.use(creamer, {
  views: __dirname + '/views',
  controllers: __dirname + '/controllers',
  layout: require(__dirname + '/views/layout')
});

app.http.before = [
  ecstatic(__dirname + '/../public', {
    autoIndex: false,
    cache: true
  })
];

app.router.get('/', function() {
  return this.res.html(this.bind('index', {
    home: '.active'
  }));
});

app.router.get('/about', function() {
  return this.res.html(this.bind('about', {
    about: '.active'
  }));
});

app.start(3000, function() {
  return console.log('running...');
});
