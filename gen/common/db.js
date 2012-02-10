(function() {
  var MySQLPool, config, mvc, pool;

  mvc = require('./../mvc');

  config = require('./../config');

  MySQLPool = require("mysql-pool").MySQLPool;

  pool = new MySQLPool({
    poolSize: 4,
    user: config.DB_USER,
    password: config.DB_PASS,
    database: config.DB_NAME,
    host: config.DB_HOST,
    port: config.DB_PORT
  });

  exports.query = function(sql, params, onSuc, onErr) {
    return pool.query(sql, params, function(err, rows, fields) {
      if (err != null) {
        if (onErr != null) {
          return onErr(err);
        } else {
          throw err;
        }
      } else {
        return onSuc(rows);
      }
    });
  };

  exports.exec = function(sql, params, onSuc, onErr) {
    return pool.query(sql, params, function(err, info) {
      if (err != null) {
        if (onErr != null) {
          return onErr(err);
        } else {
          throw err;
        }
      } else {
        return onSuc();
      }
    });
  };

}).call(this);
