div "#login_wrapper",->
	br -> 
	if @user?
		form action:"/login/logout",method:"post",-> 
			span -> "You have logged in as \"#{@user}\"."
			button -> "Logout"
	else
		div -> "User your DB username/password:"
		form action:"/login/login",method:"post",-> 
			table "#login_table",->
				tr ->
					td -> "&nbsp;"
					td ->
				tr -> 
					td -> "Username: "
					td ->
						input name:"user",type:"text", value:@dbUser, ->
				tr ->
					td ->"Password: "
					td ->
						input name:"pass",type:"password", ->
				tr ->
					td ->
					td ->
						button -> "Login"
				tr ->
					td ->
					td -> 
						span ".error",-> @errorMessage if @errorMessage?
