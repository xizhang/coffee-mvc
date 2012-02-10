(function() {
  var async, config, db, mvc;

  mvc = require("./../mvc");

  db = require("./../common/db");

  async = require("async-mini");

  config = require("./../config");

  exports.index = function(req, data, render) {
    data.selectedTab = "login";
    data.user = req.session.user;
    data.dbUser = config.DB_USER;
    return render(false);
  };

  exports.login = function(req, data, render) {
    if (req.body.user === config.DB_USER && req.body.pass === config.DB_PASS) {
      req.session.user = req.body.user;
    } else {
      data.errorMessage = "Password incorrect";
    }
    return exports.index(req, data, render);
  };

  exports.logout = function(req, data, render) {
    req.session.user = null;
    return exports.index(req, data, render);
  };

}).call(this);
