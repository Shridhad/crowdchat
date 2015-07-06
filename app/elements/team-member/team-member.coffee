Polymer
	is: "team-member"
	properties:
		members: 
			type: Array
			value: []
		selected:
			type: Number
			notify: true
		currentMember:
			type: Object
			value: null

	ready: ->
		@callInfo = @$$('.call-info-wrapper')
		@currentMember = @members[0]

	disconnect: ->
		if !@userProfile
			@userProfile = document.getElementsByClassName('user-profile-wrapper')[0]
		
		@userProfile.parentElement.disconnect() if @userProfile
		
	hideCallInfo: ->
		@callInfo.classList.remove('call-in-progress') if @callInfo

	showCallInfo: ->
		@currentMember = @members[@selected] if @members
		@callInfo = @$$('.call-info-wrapper')
		@callInfo.classList.add('call-in-progress')
	
	selectionChanged: (event) ->
		@selected = event.currentTarget.index
		@currentMember = @members[@selected] if @members
		
				
				