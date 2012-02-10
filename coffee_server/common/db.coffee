mvc = require('./../mvc')
config = require('./../config')

MySQLPool = require("mysql-pool").MySQLPool

pool = new MySQLPool
	poolSize: 4
	user:     config.DB_USER
	password: config.DB_PASS
	database: config.DB_NAME
	host: 		config.DB_HOST
	port:			config.DB_PORT

exports.query=(sql, params, onSuc, onErr)->
	pool.query sql,params, (err, rows, fields)->
		if err?
			if onErr?
				onErr err
			else
				throw err
		else 
			onSuc rows

exports.exec=(sql, params, onSuc, onErr)->
	pool.query sql,params, (err,info)->
		if err?
			if onErr?
				onErr err
			else
				throw err
		else 
			onSuc()
