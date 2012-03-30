var app, creamer, flatiron;

flatiron = require('flatiron');

creamer = require('creamer');

app = flatiron.app;

app.use(flatiron.plugins.http);

app.use(creamer, {
  layout: function() {
    doctype(5);
    return html(function() {
      head(function() {
        return title('Single Page');
      });
      return body(function() {
        return content();
      });
    });
  }
});

app.router.get('/', function() {
  return this.res.html(app.bind(function() {
    return h1('Hello Coffeecup');
  }));
});

app.start(3000, function() {
  return console.log('Listening.. on port 3000');
});
