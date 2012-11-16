window.beats.Network::defaults =
  ml_control: false
  q_control: false
  dt: 300

window.beats.Network::initialize = ->
  @set 'nodelist', new window.beats.NodeList
  @set 'linklist', new window.beats.LinkList
  @set 'networklist', new window.beats.NetworkList
  @set 'sensorlist', new window.beats.SensorList
  @set 'signallist', new window.beats.SignalList
  @set 'description', new window.beats.Description
  @set 'position', new window.beats.Position
  @get('position').get('point').push(new window.beats.Point)

window.beats.Network::description_text = ->
  @get('description').get('text')

window.beats.Network::set_description_text = (s) ->
  @get('description').set('text',s)