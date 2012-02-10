table "#projects_table",->
	tr ".table_header",->
		td ".cell",-> "Name"
		td ".cell",-> "URL"
		td ".cell",-> "Timestamp"
		if @user?
			td ".cell",-> "&nbsp;"
	isAlt=false
	for row in @rows
		isAlt=!isAlt
		if isAlt
			rowClass ="row"
		else
			rowClass ="row-alt"
		tr "#{rowClass}",->
			td ".cell",-> "#{row.name}"
			td ".cell",->"<a href='#{row.url}'>#{row.url}</a>"
			td ".cell",->" #{row.timestamp}"
			if @user?
				td ".cell",->
					img ".del_icon",src:"/img/del.png",id:row.id, -> 
