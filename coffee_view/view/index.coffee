h2 -> "Download"
p ".quoted",-> "git clone https://github.com/xizhang/coffee-mvc"
h2 -> "Setup Database"
div -> @partial("partial/db_setup_guide")
h2 -> "Run"
div ".quoted",->
	ol ->
		li ->"Run \"cake watch\" in a terminal. This is for compiling CoffeeScript in real time."
		li ->"Run \"node server.js\" in another termial."
		li ->"Open http://localhost:8000 in your browser."
h2 "Remove Example Code from Template"
p -> "To remove all the example code and start with a blank template:"
p ".quoted",->"sh clear.sh"
br ->
br ->
coffeescript ->
	$.log "debug info"

