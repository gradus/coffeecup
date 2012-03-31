var app, creamer, ecstatic, flatiron;

flatiron = require('flatiron');

creamer = require('creamer');

ecstatic = require('ecstatic');

app = flatiron.app;

app.use(flatiron.plugins.http);

app.use(creamer, {
  views: __dirname + '/views',
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

app.router.get('/:page', function(page) {
  if (typeof options === "undefined" || options === null) options = {};
  options[page] = '.active';
  return this.res.html(this.bind(page, options));
});

app.start(3000, function() {
  return console.log('running...');
});
