sirius_classes_with_extensions = [
  'Begin',
  'Controller', 'ControllerSet',
  'Data_sources', 'Density', 'Display_position', 'Dynamics', 
  'End', 'Event', 'EventSet',
  'Input', 'Intersection', 
  'Link', 'LinkList',
  'Network', 'NetworkList', 'Node', 'NodeList', 
  'Od', 'ODList', 'Output', 
  'Phase', 'Plan', 'PlanList', 'PlanSequence', 'Point', 'Position', 
  'Scenario', 'Sensor', 'SensorList', 'Settings', 'Signal', 'SignalList'
]

sirius_classes_without_extensions = [
  'ALatLng', 'CapacityProfile', 'Data_source', 'Decision_point', 'Decision_point_split',
  'Decision_points', 'DecisionPoints', 'DemandProfile', 'DemandProfileSet', 'Description',
  'DirectionsCacheEntry', 'DirectionsCache', 'DownstreamBoundaryCapacityProfileSet', 'EncodedPolyline',
  'FeedbackElements', 'From', 'FundamentalDiagram', 'FundamentalDiagramProfile', 'FundamentalDiagramProfileSet', 
  'InitialDensitySet', 'Inputs', 'IntersectionCacheEntry',
  'IntersectionCache', 'Knob', 'Lane_count_change', 'Levels', 
  'LinkGeometry', 'Link_reference', 'Linkpair', 'Links', 
  'NetworkConnections', 'Networkpair', 'Od_demandProfile', 'ODDemandProfileSet', 'Outputs', 
  'On_off_switch', 'Outputs', 'Parameter',
  'Parameters', 'Plan_reference', 'Points', 'Postmile',
  'Qcontroller', 'Route_segment', 'Route_segments', 'RouteSegments',
  'ScenarioElement', 'Splitratio',  'SplitratioEvent',  'SplitratioProfile','SplitRatioProfileSet', 'Stage',
  'TargetElements', 'To', 'Units', 'Vehicle_type', 'VehicleTypes', 'VehicleTypeOrder', 'Weavingfactors', 'WeavingfactorSet'
]

sirius_map_view_classes = [
  'AppView', 'MapLinkView', 'MapMarkerView', 'MapNetworkView', 'MapNodeView', 'MapSensorView', 'TreeParentItemView', 'TreeChildItemView', 'Util'
]

load_sirius_classes = (after) ->
  head.js "js/Sirius.js", ->
    class_paths = _.map(sirius_classes_without_extensions, (cname) -> "js/#{cname}.js")
    class_paths = class_paths.concat _.flatten(_.map(sirius_map_view_classes, (cname) -> "js/#{cname}.js"))
    class_paths = class_paths.concat _.flatten(_.map(
      sirius_classes_with_extensions,
      (cname) -> ["js/#{cname}.js","js/extensions/#{cname}.js"]
    ))
    class_paths.push after
    head.js.apply(@, class_paths)

head.js('../libs/js/jquery-1.7.1.js',
        '../libs/js/jquery-ui-1.8.18.min.js',
        'js/menus.js',
        'js/menu-data.js',
        '../libs/js/underscore.js',
        '../libs/js/backbone.js',
        '../libs/js/bootstrap/js/bootstrap.js', ->
            load_sirius_classes ->
                google.maps.event.addDomListener(window, 'load', new window.sirius.AppView())
)