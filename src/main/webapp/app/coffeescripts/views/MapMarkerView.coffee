# MapMarkerView is base class for scenario elements represented by a
# single latitude and longitude on the Map
class window.sirius.MapMarkerView extends Backbone.View
  @IMAGE_PATH: '/lib/data/img/'
  $a = window.sirius

  initialize: (@model) ->
    # get the position, we only draw if the position is defined
    # TODO deal with getting a position if it is not defined
    @latLng = $a.Util.getLatLng(model)
    @draw()
    gevent = google.maps.event
    #gevent.addListener(@marker, 'dragend', @dragMarker())
    gevent.addListener(@marker, 'click', (event) => @manageMarkerSelect())
    gevent.addListener(@marker, 'dblclick', (mouseEvent) => @_editor())
    $a.broker.on('map:clear_selected', @clearSelected, @)
    $a.broker.on("map:select_item:#{@model.cid}", @makeSelected, @)
    $a.broker.on("map:clear_item:#{@model.cid}", @clearSelected, @)
    $a.broker.on('map:init', @render, @)
    $a.broker.on('map:clear_map', @removeElement, @)

  render: ->
    @marker.setMap($a.map)
    @

  # Draw the marker by determining the type of icon
  # is used for each type of element. The default is the
  # our standard dot.png. Each subclasses overrides get_icon
  # to pass the correct icon
  draw: ->
    @marker = new google.maps.Marker
        position: @latLng
        draggable: true
        icon: @getIcon()
        title: @_getTitle()

  _getTitle: ->
    title = "Name: #{@model.get('name')}\n"
    title += "Latitude: #{@latLng.lat()}\n"
    title += "Longitude: #{@latLng.lng()}"
    title

  getIcon: (img) ->
    @getMarkerImage img

  getMarkerImage: (img) ->
    new google.maps.MarkerImage("#{MapMarkerView.IMAGE_PATH}#{img}.png",
      new google.maps.Size(32, 32),
      new google.maps.Point(0,0),
      new google.maps.Point(16, 16)
    )

  # in order to remove an element you need to unpublish the events,
  # hide the marker and set it to null
  removeElement: ->
    $a.broker.off('map:init')
    $a.broker.off('map:clear_selected')
    $a.broker.off("map:select_item:#{@model.cid}")
    $a.broker.off("map:clear_item:#{@model.cid}")
    @hideMarker() if @marker?
    @marker = null

  # Context Menu
  #
  # Create the Marker Context Menu.
  #
  # This class is always called by it overridden subclass method. The
  # menu items are stored with their events in an array and can be
  # configired in the menu-data.coffee file. We create a dependency
  # with the ContextMenuView here. There may a better way to do
  # this. I also add the contextMenu itself to the model so the same
  # menu can be added to the tree items for this node
  _contextMenu: (type, menuItems) ->
    @contextMenuOptions =
      class: 'context_menu'
      id: "context-menu-#{type}-#{@model.id}"
      menuItems: $a.Util.copy(menuItems)

    #set this id for the select item so we know what event to call
    _.each(@contextMenuOptions.menuItems, (item) => item.id = "#{@model.cid}")

    @contextMenu = new $a.ContextMenuView(@contextMenuOptions)
    google.maps.event.addListener(@marker, 'rightclick', (mouseEvent) =>
      @contextMenu.show mouseEvent.latLng
    )
    @model.set('contextMenu', @contextMenu)

  # events used to move the marker and update its position
  dragMarker: ->
    @latLng = @marker.getPosition()
    $a.map.panTo(@latLng)

  ################# The following handles the show and hide of node layers
  hideMarker: ->
    @marker.setMap(null)

  showMarker: ->
    @marker.setMap($a.map)

  # Used by subclasses to get name of image in order to swap between selected
  # and not selected
  _getIconName: () ->
    tokens = @marker.get('icon').url.split '/'
    lastIndex =  tokens.length - 1
    tokens[lastIndex]

  _setSelected: (img) ->
    @marker.setIcon(@getMarkerImage(img))

  # This method swaps the icon for the selected icon
  makeSelected: (img) ->
    @_setSelected img

  # This method swaps the icon for the de-selected icon
  clearSelected: (img) ->
    @_setSelected img