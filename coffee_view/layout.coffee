doctype 5
html ->
	head ->
		title "Coffee MVC"
		link rel: 'icon', href: '/img/favicon.ico'
		link rel: "stylesheet", href: '/css/layout.css'
		link rel: 'stylesheet', href: '/css/main.css'

		script src: '/js/jquery-1.6.4.min.js'
		script src: '/mvc.js'
	body ->
		# set browser debug flag
		input "#hidden-debug", type:"hidden", value: "#{@debugJs}"
		# here begins the page
		div "#header_wrapper",->
			div "#header_title",-> "Coffee MVC"
			div "#header_des",-> "Keywords: NodeJS, Express.js, CoffeeScript, CoffeeKup, YUICompressor, MVC"
		div "#nav_wrapper",->
			# set selected tab css class
			overviewClass=guideClass=exampleClass=ajaxClass= 'nav_tab'
			switch @selectedTab
				when 'overview'
					overviewClass += '.nav_tab_selected'
				when 'guide'
					guideClass += '.nav_tab_selected'
				when 'example'
					exampleClass+='.nav_tab_selected'
				when 'login'
					ajaxClass+='.nav_tab_selected'
			div ".#{overviewClass}",-> 
				a href:'/',->"Overview"
			div ".#{guideClass}",-> 
				a href:'/guide',->"Guide"
			div ".#{exampleClass}",->
				a href:'/example',->"Examples"
			div ".#{ajaxClass}",->
				a href:'/login',->"Login/Logout"
		# this wrapper contains the view
		div "#main_wrapper", ->
			@body
		div "#footer_wrapper",->
			div "#footer_title",->"This is a open source project."
