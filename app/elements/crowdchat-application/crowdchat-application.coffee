Polymer
  is: 'crowdchat-application'
  properties:
  	selected:
  		type: Number
  		value: 0
  		observer: '_selectedChanged'
  	selectedUser: 
  		type: Object
  		value: null
    overlaystatus:
      type: String
      value: "closed"
      notify: true  
  handleAjaxResponse: (req)->
  	@data = req.target.lastResponse
  	@selectedUser = @data.members[0]
  _selectedChanged: (newValue, oldValue) ->
  	@selectedUser = @data.members[newValue] if @data
  	
