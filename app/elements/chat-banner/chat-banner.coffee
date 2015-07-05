Polymer
  is: "chat-banner"
  properties:
    title:
      type: String
      value: 'Crowdchat'
    closable:
    	type: Boolean
    	reflectToAttribute: true
    	value: false

  showOverlay: (event)->
  	overlay = document.getElementById('crowdchatOverlay')
  	overlay.open() if overlay
