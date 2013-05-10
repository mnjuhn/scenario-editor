class window.beats.Density extends Backbone.Model
  ### $a = alias for beats namespace ###
  $a = window.beats
  @from_xml1: (xml, object_with_id) ->
    deferred = []
    obj = @from_xml2(xml, deferred, object_with_id)
    fn() for fn in deferred
    obj
  
  @from_xml2: (xml, deferred, object_with_id) ->
    return null if (not xml? or xml.length == 0)
    obj = new window.beats.Density()
    vehicleType = xml.children('vehicleType')
    obj.set('vehicletype', $a.VehicleType.from_xml2(vehicleType, deferred, object_with_id))
    crudFlag = xml.children('crudFlag')
    obj.set('crudflag', $a.CrudFlag.from_xml2(crudFlag, deferred, object_with_id))
    id = $(xml).attr('id')
    obj.set('id', Number(id))
    link_id = $(xml).attr('link_id')
    obj.set('link_id', Number(link_id))
    destination_network_id = $(xml).attr('destination_network_id')
    obj.set('destination_network_id', Number(destination_network_id))
    density = $(xml).attr('density')
    obj.set('density', Number(density))
    modStamp = $(xml).attr('modStamp')
    obj.set('modStamp', modStamp)
    if obj.resolve_references
      obj.resolve_references(deferred, object_with_id)
    obj
  
  to_xml: (doc) ->
    xml = doc.createElement('density')
    if @encode_references
      @encode_references()
    xml.appendChild(@get('vehicletype').to_xml(doc)) if @has('vehicletype')
    xml.appendChild(@get('crudflag').to_xml(doc)) if @has('crudflag')
    xml.setAttribute('id', @get('id')) if @has('id')
    xml.setAttribute('link_id', @get('link_id')) if @has('link_id')
    xml.setAttribute('destination_network_id', @get('destination_network_id')) if @has('destination_network_id')
    xml.setAttribute('density', @get('density')) if @has('density')
    xml.setAttribute('modStamp', @get('modStamp')) if @has('modStamp')
    xml
  
  deep_copy: -> Density.from_xml1(@to_xml(), {})
  inspect: (depth = 1, indent = false, orig_depth = -1) -> null
  make_tree: -> null