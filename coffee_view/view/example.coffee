if @isDbReady
	div ->@partial('partial/projects_table', {rows :@projects, user:@user})
	br -> 
	br ->
	if @user?
		form action:"/example/add", method:"post",->
			div -> "Add a new project:"
			table ->
				tr ->
					td -> "Name: "
					td -> input name:"project_name",type:"text",->
				tr ->
					td -> "URL: "
					td -> input name:"project_url",type:"text",->
				tr ->
					td ->
					td -> button ->"Add"
	else
		div -> "<a href='/login'>Login</a> to modify the table."
else
	div ".error",-> "Database is unavailable. Maybe you forgot to setup the config file? Try following steps please."
	div ->@partial('partial/db_unavailable')

coffeescript ->
	$ ->
		$('.del_icon').click ->
			button = this
			$.post '/example/del/'+@id, (data)->
				if data.suc
					$(button).parent().parent().remove()
				else
					alert "something's wrong"
