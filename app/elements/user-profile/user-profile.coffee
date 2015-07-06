Polymer
	id: 'user-profile'
	properties:
		user:
			type: Object
			value: null
			observer: "disconnect"
	ready: ->
		@userProfile = this.$$('.user-profile-wrapper')

	call: ->
		_this = @
		if @userProfile
			@userProfile.classList.add('call-in-progress')
			setTimeout () ->
				_this.connected()
			, 2000		

	connected: ->
		@userProfile.classList.add('call-connected') if @userProfile.classList.contains('call-in-progress')
		if !@teamMember	
			@teamMember = document.querySelector('team-member')
		@teamMember.showCallInfo() if @teamMember

	disconnect: ->
		if @userProfile
			@userProfile.classList.remove('call-connected')		
			@userProfile.classList.remove('call-in-progress')
		if !@teamMember	
			@teamMember = document.querySelector('team-member')
		@teamMember.hideCallInfo() if @teamMember		

