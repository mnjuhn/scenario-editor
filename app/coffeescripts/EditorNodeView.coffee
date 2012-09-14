# This creates the editor dialogs for node elements
class window.sirius.EditorNodeView extends window.sirius.EditorView
  $a = window.sirius
  events : {
    'blur #name, #description, #type' : 'save'
    'blur #lat, #lng, #elevation' : 'saveGeo'
    'click #lock' : 'saveLocked'
    'click #edit-signal' : 'signalEditor'
    'click #choose-name' : 'chooseName'
    'click #remove-join-links' : 'removeJoinLinks'
  }

  # the options argument has the Node model and type of dialog to create('node')
  initialize: (options) ->
    options.templateData = @_getTemplateData(options.models)
    super options

  # call the super class to set up the dialog box and then set the select box
  render: ->
    super @elem
    @_setSelectedType()
    @_checkDisableElems()
    @
  
    # if tab doesn't have one of the profiles disable it
  _checkDisableElems: ->
    if (@models.length > 1)
       $('#name').attr("disabled", true)
       $('#lat').attr("disabled", true)
       $('#lng').attr("disabled", true)
       $('#elevation').attr("disabled", true)
       $('#edit-signal').attr("disabled", true)
       $('#edit-signal').addClass('ui-state-disabled')
    
    # disabled until we 
    $('#edit-signal').attr("disabled", true)
    $('#edit-signal').addClass('ui-state-disabled')
    disable = [2]
    @$el.tabs({ disabled: disable })
  
  #set selected type element
  _setSelectedType: ->
    type = @models[0].get('type');
    $(@$el[0]).find("select option[value='#{type}']").attr('selected','selected')
  
  # creates a hash of values taken from the model for the html template
  _getTemplateData: (models) ->
    name: _.map(models, (m) -> m.get('name')).join(", ") 
    description: _.map(models, (m) -> m.get('description')).join("; ") 
    lat: _.map(models, (m) -> m.get('position').get('point')[0].get('lat')).join(", ")
    lng:  _.map(models, (m) -> m.get('position').get('point')[0].get('lng')).join(", ")
    elevation:  _.map(models, (m) -> m.get('position').get('point')[0].get('elevation')).join(", ")
    lock: if models[0].has('lock') and models[0].get('lock') then 'checked' else ''

  # these are callback events for various elements in the interface
  # This is used to save the name, type and description when focus is
  # lost from the element
  save: (e) ->
    id = e.currentTarget.id
    _.each(@models, (m) -> m.set(id, $("##{id}").val()))

  # This is used to save the latitude, longitude and elevation when focus is
  # lost from the element
  saveGeo: (e) ->
    id = e.currentTarget.id
    @models[0].get('position').get('point')[0].set(id, $("##{id}").val())

  # This saves the checkbox indicating the node is locked
  saveLocked: (e) ->
    id = e.currentTarget.id
    _.each(@models, (m) -> m.set(id, $("##{id}").prop('checked')))

  # These three methods below will be configured to launch various
  # editors in future phases
  signalEditor: (e) ->
    console.log "here"
    e.preventDefault()

  chooseName: (e) ->
    e.preventDefault()

  removeJoinLinks: (e) ->
    e.preventDefault()