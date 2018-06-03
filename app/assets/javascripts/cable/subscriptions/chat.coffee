# App.cable.subscriptions.create "ChatChannel",
#   # connected: ->
#   #   @install()
#   #   @appear()
#   # disconnected: ->
#   #   @uninstall()

#   # rejected: ->
#   #   @uninstall()

#   # appear: ->
#   #   @perform("appear", appearing_on :$("main").data("appearing-on"))
  
#   # away: ->
#   #   # Calls `AppearanceChannel#away` on the server
#   #   @perform("away")


#   # buttonSelector = "[data-behavior~=appear_away]"
  
  
#   # install: ->
#   #   $(document).on "page:change.appearance", =>
#   #     @appear()

#   #   $(document).on "click.appearance", buttonSelector, =>
#   #     @away()
#   #     false

#   #   $(buttonSelector).show()

#   # uninstall: ->
#   #   $(document).off(".appearance")
#   #   $(buttonSelector).hide()
  
  
#   received: (data) ->
#     $('#messages').append data
#     console.log data

  
#   speak: (message)->
#     @perform 'speak', message: message
#     # @perform 'speak', message: message

# $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
#   if event.keyCode is 13 # return = send
#     App.room.speak event.target.value
#     event.target.value = ''
#     event.preventDefault()
