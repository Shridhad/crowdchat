Polymer
	id: 'user-profile'
	properties:
		user:
			type: Object
			value: null
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

	disconnect: ->
		if @userProfile
			@userProfile.classList.remove('call-connected')		
			@userProfile.classList.remove('call-in-progress')

