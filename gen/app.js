(function() {
  var app, config, express, router;

  express = require('express');

  app = express.createServer();

  app.configure(function() {
    app.use(express.static(__dirname + '/../file_client'));
    app.use(express.static(__dirname + '/public_web'));
    app.set('views', __dirname + '/../coffee_view');
    app.set("view options", {
      layout: true
    });
    app.set('view engine', 'coffee');
    app.register('.coffee', require('coffeekup'));
    app.use(express.bodyParser());
    app.use(express.cookieParser());
    app.use(express.session({
      secret: "keyboard cat"
    }));
    app.use(express.methodOverride());
    return app.use(app.router);
  });

  config = require("./config");

  app.configure('production', 'development', 'testing', function() {
    return config.setEnvironment(app.settings.env);
  });

  router = require('./router');

  router.route(app, express);

  app.listen(8000);

  console.log("[*] new instance  --> " + new Date() + " port: " + app.address().port + " cache: " + app.enabled('view cache'));

}).call(this);
