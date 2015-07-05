Polymer
	is: 'crowdchat-overlay'
	ready: ->
		@wrapper = @getElementsByClassName('crowdchat-overlay-wrapper')[0]
	open: ->
		_this = @
		if @wrapper
			@wrapper.style.display = 'block'
			setTimeout () -> 
				_this.wrapper.style.opacity = '1'
			, 10
	close: ->
		_this = @
		if @wrapper	
			@wrapper.style.opacity = '0'
			setTimeout () -> 
				_this.wrapper.style.display = 'none'
			,500
			
		