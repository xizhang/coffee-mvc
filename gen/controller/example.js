(function() {
  var async, db, mvc;

  mvc = require("./../mvc");

  db = require("./../common/db");

  async = require("async-mini");

  exports.index = function(req, data, render) {
    data.selectedTab = "example";
    data.user = req.session.user;
    return async.series([
      function(cb) {
        return db.query("select * from projects", [], function(result) {
          data.isDbReady = true;
          data.projects = result;
          return cb();
        }, function(err) {
          data.isDbReady = false;
          data.errorMessage = err.message;
          return cb();
        });
      }
    ], function() {
      return render(false);
    });
  };

  exports.add = function(req, data, render) {
    return async.series([
      function(cb) {
        return db.exec("insert into projects (name,url) values(?,?)", [req.body.project_name, req.body.project_url], function() {
          return cb();
        });
      }
    ], function() {
      return exports.index(req, data, render);
    });
  };

  exports.del = function(req, data, render) {
    return async.series([
      function(cb) {
        return db.exec("delete from projects where id = ?", [req.params.id], function() {
          return cb(true);
        });
      }
    ], function(suc) {
      data.suc = suc;
      return render(true);
    });
  };

}).call(this);
