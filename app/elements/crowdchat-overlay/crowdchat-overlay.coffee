Polymer
	is: 'crowdchat-overlay'
	properties:
		overlaystatus:
			type: String
			value: "closed"
			notify: true		
	
	ready: ->
		@wrapper = @getElementsByClassName('crowdchat-overlay-wrapper')[0]
	open: ->
		_this = @
		if @wrapper
			@wrapper.style.display = 'block'
			@overlaystatus = "opened"
			setTimeout () -> 
				_this.wrapper.style.opacity = '1'
			, 10
	close: ->
		_this = @
		if @wrapper	
			@wrapper.style.opacity = '0'
			@overlaystatus = "closed"
			setTimeout () -> 
				_this.wrapper.style.display = 'none'
			,500
			
		