Polymer
	is: "team-member"
	properties:
		members: 
			type: Array
			value: []
		selected:
			type: Number
			notify: true
	
	selectionChanged: (event) ->
		@selected = event.currentTarget.index
		
				
				