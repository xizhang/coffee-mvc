exports.config = require('./config')

# debug functions
exports.log = ()-> console.log arguments if exports.config.DEBUG_LOG
exports.warn = ()-> console.log arguments if exports.config.DEBUG_WARN
exports.error = ()-> console.log arguments if exports.config.DEBUG_ERROR

