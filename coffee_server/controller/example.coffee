mvc = 	require "./../mvc"
db=			require "./../common/db"
async=	require "async-mini"

# the url will be parsed like: controller/method/id, see router.coffee
# each controller should have a default method called "index"
# each method has 3 params: req, data, render.
# - req: the Express.js req object
# - data: the data object will be passed to view engine. 
# - render: the callback function to render the corresponding view and finish the method

exports.index = (req, data, render)->
	# highlight the selectedTab in layout
	data.selectedTab = "example"
	# set user info based on session
	data.user = req.session.user
	# remember that node.js is async. So most operations will only make sense when used along 
	# with some flow-control module like "async-mini"
	async.series(
		[ 
			(cb)->
				db.query "select * from projects",[]
				,(result)->
					data.isDbReady=true
					data.projects = result
					cb()
				,(err)->
					data.isDbReady=false
					data.errorMessage = err.message
					cb()
		]
		,()->
			# when false flag is given the page is rendered as view
			render false
		)

exports.add = (req, data, render)->
	async.series(
		[
			(cb)->
				db.exec "insert into projects (name,url) values(?,?)"
				,[req.body.project_name,req.body.project_url]
				,()->
					cb()
		]
		,()->
			# call another method here. 
			exports.index req, data, render
		)

# this is a AJAX method example
exports.del = (req, data, render)->
	async.series(
		[
			(cb)->
				db.exec "delete from projects where id = ?"
				,[req.params.id]
				,()->
					cb(true)
		]
		,(suc)->
			data.suc = suc
			# when true flag is given this will be rendered as a API, which is, only JSON string will be sent
			render true
		)
	
