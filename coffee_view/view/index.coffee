h2 -> "Purpose"
p -> "This is a CoffeeScript MVC template for web applications. It's based on Express.js."
h2 ->"Download/Install"
h3 -> "Get The Code"
div ".quoted",-> "git clone git://github.com/xizhang/coffee-mvc.git"
h3 -> "Setup Database"
div -> @partial("partial/db_setup_guide")
h3 -> "Run"
div ".quoted",->
	ol ->
		li ->"Open a terminal.Change directory. Run \"cake watch\". This is for compiling CoffeeScript in real time."
		li ->"Open a second terminal. Run \"node server.js\"."
		li ->"Open http://localhost:8000 in your browser."
h3 ->"Clear Example"
p -> "To remove all the example code and start with a blank mvc project, do:"
h3 ->"Release"
div ->"asdf"
h2 ->"Tool List"
ul ->
	li ->"NodeJS"
	li ->"YUICompressor"
	li -> "Express.js"
	li -> "CoffeeScript"
	li -> "CoffeeKup"
	li -> "mysql"
	li -> "mysql-pool"
	li -> "express-coffee"
	li -> "JQuery"
	
coffeescript ->
	$.log "debug info"

