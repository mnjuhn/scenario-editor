// Generated by CoffeeScript 1.3.1
(function() {
  var aurora_classes_with_extensions, aurora_classes_without_extensions, load_aurora_classes;

  aurora_classes_with_extensions = ['Begin', 'Capacity', 'Controller', 'ControllerSet', 'Data_sources', 'Demand', 'Density', 'Display_position', 'Dynamics', 'End', 'Event', 'EventSet', 'Fd', 'Input', 'Intersection', 'Link', 'LinkList', 'MonitorList', 'Network', 'NetworkList', 'Node', 'NodeList', 'Od', 'ODList', 'Output', 'PathList', 'Phase', 'Plan', 'PlanList', 'PlanSequence', 'Point', 'Position', 'Qmax', 'Scenario', 'Sensor', 'SensorList', 'Settings', 'Signal', 'SignalList', 'Source', 'Splitratios'];

  aurora_classes_without_extensions = ['Util', 'MapMarkerView', 'MapSensorView', 'MapNodeView', 'MapLinkView', 'ALatLng', 'ArrayText', 'CapacityProfileSet', 'Components', 'Control', 'Controlled', 'DemandProfileSet', 'Description', 'DirectionsCacheEntry', 'DirectionsCache', 'Display', 'EncodedPolyline', 'From', 'InitialDensityProfile', 'Inputs', 'IntersectionCacheEntry', 'IntersectionCache', 'Lane_count_change', 'Levels', 'Limits', 'LinkGeometry', 'LinkPairs', 'Links', 'Lkid', 'Monitored', 'Monitor', 'Monitors', 'Onramp', 'Onramps', 'Outputs', 'Pair', 'Parameter', 'Parameters', 'Path', 'Plan_reference', 'Points', 'Postmile', 'Qcontroller', 'SplitRatioProfileSet', 'Srm', 'Stage', 'Table', 'To', 'Units', 'VehicleTypes', 'Vtype', 'Weavingfactors', 'Wfm', 'Zone', 'Zones'];

  load_aurora_classes = function(after) {
    return head.js("js/Aurora.js", function() {
      var class_paths;
      class_paths = _.map(aurora_classes_without_extensions, function(cname) {
        return "js/" + cname + ".js";
      });
      class_paths = class_paths.concat(_.flatten(_.map(aurora_classes_with_extensions, function(cname) {
        return ["js/" + cname + ".js", "js/extensions/" + cname + ".js"];
      })));
      class_paths.push(after);
      return head.js.apply(this, class_paths);
    });
  };

  head.js('../libs/js/jquery-1.7.1.js', '../libs/js/underscore.js', '../libs/js/backbone.js', '../libs/js/bootstrap/js/bootstrap.js', function() {
    return load_aurora_classes(function() {
      return $("#load_scenario").click(function() {
        var xml, xml_text;
        xml_text = $("#scenario_text").val();
        xml = $.parseXML(xml_text);
        return window.textarea_scenario = window.aurora.Scenario.from_xml($(xml).children());
      });
    });
  });
}).call(this);
