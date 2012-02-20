# ## Backpack.Overlay
class Backpack.Overlay extends Backpack.Component

  events:
    'click': 'unlock'

  defaults:
    'lockOverlay': false
    'color': 'rgba(0,0,0,0.7)'

  initialize: ->
    super()
    @addClass('backpack-overlay')
    {lockOverlay, color} = @options
    @setLock(lockOverlay)
    @setColor(color)
    @

  render: =>
    @parent.prepend(@el)
    @
    
  unlock: =>
    @close() unless @lockOverlay
    @

  close: =>
    super()
    @trigger('overlay-close')
    @
    
  setLock: (@lockOverlay) =>
    @
  
  setColor: (color) =>
    @el.style.backgroundColor = color
    @



# ## Backpack.Dialog
class Backpack.Dialog extends Backpack.Component

  events:
    'click': 'close'

  defaults:
    'lockOverlay': false
    'showOverlay': false

  initialize: ->
    super()
    @addClass('backpack-dialog')
    @setOverlay() if @options.showOverlay
    @

  setOverlay: =>
    @overlay = new Backpack.Overlay({ lockOverlay: @options.lockOverlay })
    @overlay.on('overlay-close', @close)
    @

  show: =>
    super()
    @overlay?.render().show()
    @

  hide: =>
    super()
    @overlay?.hide()
    @

  close: =>
    super()
    @overlay?.remove()
    @



# ## Backpack.Modal
class Backpack.Modal extends Backpack.Dialog

  defaults:
    'lockOverlay': true
    'showOverlay': true

  initialize: ->
    super()
    @addClass('backpack-modal')
    @