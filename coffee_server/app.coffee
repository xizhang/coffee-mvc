#config app
express = require 'express'
app = express.createServer()
app.configure ->
	# static client file path: css, image, etc.
	app.use express.static __dirname + '/../file_client'
	# generated static client file
	app.use express.static __dirname + '/public_web' 
	# set view path and engine
	app.set 'views', __dirname + '/../coffee_view'
	app.set "view options", layout: true
	app.set 'view engine', 'coffee'
	app.register '.coffee', require('coffeekup')
	# some middle-wares
	app.use express.bodyParser()
	app.use express.cookieParser()
	app.use express.session { secret: "keyboard cat" }
	app.use express.methodOverride()
	app.use app.router

# set instance running environments. they have to match those in config.coffee
config = require "./config"
app.configure 'production', 'development', 'testing', ->
	config.setEnvironment app.settings.env

# route it
router = require './router'
router.route(app,express)

# run it on 8002 or any port you like
app.listen 8000
console.log "[*] new instance  --> " + new Date()+" port: "+ app.address().port+ " cache: " + app.enabled('view cache')

