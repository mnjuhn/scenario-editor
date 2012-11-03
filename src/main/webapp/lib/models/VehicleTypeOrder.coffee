class window.beats.VehicleTypeOrder extends Backbone.Model
  ### $a = alias for beats namespace ###
  $a = window.beats
  @from_xml1: (xml, object_with_id) ->
    deferred = []
    obj = @from_xml2(xml, deferred, object_with_id)
    fn() for fn in deferred
    obj
  
  @from_xml2: (xml, deferred, object_with_id) ->
    return null if (not xml? or xml.length == 0)
    obj = new window.beats.VehicleTypeOrder()
    vehicle_type = xml.children('vehicle_type')
    obj.set('vehicle_type', _.map($(vehicle_type), (vehicle_type_i) -> $a.Vehicle_type.from_xml2($(vehicle_type_i), deferred, object_with_id)))
    if obj.resolve_references
      obj.resolve_references(deferred, object_with_id)
    obj
  
  to_xml: (doc) ->
    xml = doc.createElement('VehicleTypeOrder')
    if @encode_references
      @encode_references()
    _.each(@get('vehicle_type') || [], (a_vehicle_type) -> xml.appendChild(a_vehicle_type.to_xml(doc)))
    xml
  
  deep_copy: -> VehicleTypeOrder.from_xml1(@to_xml(), {})
  inspect: (depth = 1, indent = false, orig_depth = -1) -> null
  make_tree: -> null