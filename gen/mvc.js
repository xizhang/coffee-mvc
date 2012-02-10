(function() {

  exports.config = require('./config');

  exports.log = function() {
    if (exports.config.DEBUG_LOG) return console.log(arguments);
  };

  exports.warn = function() {
    if (exports.config.DEBUG_WARN) return console.log(arguments);
  };

  exports.error = function() {
    if (exports.config.DEBUG_ERROR) return console.log(arguments);
  };

}).call(this);
