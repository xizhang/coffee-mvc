mvc = require "./../mvc"

exports.index = (req,data,render)->
	data.selectedTab = "overview"
	render false
