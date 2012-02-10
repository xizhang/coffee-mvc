mvc = 	require "./../mvc"
db=			require "./../common/db"
async=	require "async-mini"

exports.index = (req, data, render)->
	data.selectedTab = "example"
	data.user = req.session.user
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
			exports.index req, data, render
		)
			
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
			render true
		)
	
