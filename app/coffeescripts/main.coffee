sirius_classes_with_extensions = [
  'Begin','Capacity','Controller', 'ControllerSet',
  'Data_sources','Demand', 'Density', 'Display_position',
  'Dynamics', 'End', 'Event', 'EventSet', 'Fd', 'Input',
  'Intersection', 'Link', 'LinkList', 'MonitorList',
  'Network', 'NetworkList', 'Node', 'NodeList', 'Od',
  'ODList', 'Output', 'PathList', 'Phase', 'Plan', 'PlanList',
  'PlanSequence', 'Point', 'Position', 'Qmax', 'Scenario',
  'Sensor', 'SensorList', 'Settings', 'Signal', 'SignalList',
  'Source', 'Splitratios'
]

sirius_classes_without_extensions = [
  'Util','MapMarkerView','MapSensorView','MapNodeView','MapLinkView'
  'ALatLng', 'ArrayText', 'CapacityProfileSet', 'Components',
  'Control', 'Controlled', 'DemandProfileSet', 'Description',
  'DirectionsCacheEntry', 'DirectionsCache', 'Display', 'EncodedPolyline',
  'From', 'InitialDensityProfile', 'Inputs', 'IntersectionCacheEntry',
  'IntersectionCache', 'Lane_count_change', 'Levels', 'Limits',
  'LinkGeometry', 'LinkPairs', 'Links', 'Lkid', 'Monitored', 'Monitor',
  'Monitors', 'Onramp', 'Onramps', 'Outputs', 'Pair', 'Parameter',
  'Parameters', 'Path', 'Plan_reference', 'Points', 'Postmile',
  'Qcontroller', 'SplitRatioProfileSet', 'Srm', 'Stage', 'Table',
  'To', 'Units', 'VehicleTypes', 'Vtype', 'Weavingfactors', 'Wfm',
  'Zone', 'Zones'
]

load_sirius_classes = (after) ->
  head.js "js/Sirius.js", ->
    class_paths = _.map(sirius_classes_without_extensions, (cname) -> "js/#{cname}.js")
    class_paths = class_paths.concat _.flatten(_.map(
      sirius_classes_with_extensions,
      (cname) -> ["js/#{cname}.js","js/extensions/#{cname}.js"]
    ))
    class_paths.push after
    head.js.apply(@, class_paths)

head.js('../libs/js/jquery-1.7.1.js',
				'../libs/js/jquery-ui-1.8.18.min.js',
        '../libs/js/underscore.js',
        '../libs/js/backbone.js',
        '../libs/js/bootstrap/js/bootstrap.js', ->
            load_sirius_classes ->
              $("#load_scenario").click ->
                xml_text = $("#scenario_text").val()
                xml = $.parseXML(xml_text)
                window.textarea_scenario = window.sirius.Scenario.from_xml($(xml).children())
)