mvc = 	require "./../mvc"
db=			require "./../common/db"
async = require "async-mini"
config = require "./../config"

exports.index = (req, data, render)->
	data.selectedTab = "login"
	data.user = req.session.user
	data.dbUser = config.DB_USER
	render false

exports.login = (req, data, render)->
	if req.body.user == config.DB_USER and req.body.pass ==config.DB_PASS
		req.session.user = req.body.user
	else
		data.errorMessage = "Password incorrect"
	exports.index req,data,render
	
exports.logout = (req, data, render)->
	req.session.user=null
	exports.index req,data,render
