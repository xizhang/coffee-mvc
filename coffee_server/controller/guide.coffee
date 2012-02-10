mvc = require "./../mvc"

exports.index = (req,data, render)->
	data.selectedTab = "guide"
	render false
