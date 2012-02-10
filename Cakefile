fs						= require 'fs'
{print}				= require 'sys'
{spawn, exec}	= require 'child_process'

build = (watch, callback) ->

	options = ['-c', '-o', 'gen', 'coffee_server']
	options.unshift '-w' if watch

	serverCode = spawn 'coffee', options
	serverCode.stdout.on 'data', (data) -> print data.toString()
	serverCode.stderr.on 'data', (data) -> print data.toString()

	options = ['-c', '-o', 'gen/public_web', 'coffee_client']
	options.unshift '-w' if watch
	clientCode = spawn 'coffee', options
	clientCode.stdout.on 'data', (data) -> print data.toString()
	clientCode.stderr.on 'data', (data) -> print data.toString()


task 'build', 'Compile CoffeeScript source files', ->
	build()

task 'watch', 'Recompile CoffeeScript source files when modified', ->
	build true
	