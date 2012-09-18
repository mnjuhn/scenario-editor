// Generated by CoffeeScript 1.3.1
(function() {
  sirius_jasmine_specs = ['BeginSpec', 'ControllerSpec', 'DemandProfileSpec', 'DensitySpec',
        'EditorNodeViewSpec', 'EditorLinkViewSpec', 'EditorSensorViewSpec', 'EndSpec', 'EventSpec',
        'InputSpec', 'IntersectionSpec', 'LinkSpec', 'MapLinkViewSpec', 'MapNodeViewSpec',
        'NodeSpec', 'OutputSpec', 'OdSpec', 'ScenarioSpec',
        'SignalSpec', 'SplitratioProfileSpec'];
    
  load_sirius_classes = function(after) {
    return head.js("../js/Sirius.js",'../js/sirius-classes-load.js', function() {
      var class_paths;
      class_paths = _.map(window.sirius.sirius_classes_without_extensions, function(cname) {
        return "../js/" + cname + ".js";
      });
      class_paths = class_paths.concat(_.flatten(_.map(window.sirius.sirius_map_view_classes, function(cname) {
        return "../js/" + cname + ".js";
      })));
      class_paths = class_paths.concat(_.flatten(_.map(window.sirius.sirius_model_view_classes, function(cname) {
        return "../js/" + cname + ".js";
      })));
      class_paths = class_paths.concat(_.flatten(_.map(window.sirius.sirius_classes_with_extensions, function(cname) {
        return ["../js/" + cname + ".js", "../js/extensions/" + cname + ".js"];
      })));
      class_paths.push(after);
      return head.js.apply(this, class_paths);
    });
  };

  load_jasmine_specs_templates = function(after){
    return head.js('lib/jasmine-1.2.0/jasmine.js',
      'lib/jasmine-1.2.0/jasmine-html.js', 
      'lib/jasmine-jquery.js',
      'lib/jasmine-1.2.0/console-runner.js',  
      'spec/SpecHelper.js', 
        function() {
          var class_paths;
          class_paths = _.map(sirius_jasmine_specs, function(cname) {
              return "spec/" + cname + ".js";
          });
          class_paths.push(after);
          return head.js.apply(this, class_paths);
        });
  };
  
  window.loadSirius = function(after) {
    return head.js("../js/Sirius.js", '../js/menu-data.js', 'scenario-xml.js', function() {
      return load_sirius_classes(function() {
          return load_jasmine_specs_templates(after);
        });
    });
  };

  window.runWithIncludes = function(runner) {
      head.js('https://www.google.com/jsapi', 
        '../../lib/js/jquery-1.7.1.js', 
        '../../lib/js/jquery-ui-1.8.21/js/jquery-ui-1.8.21.min.js', 
        '../../lib/js/underscore.js', 
        '../../lib/js/backbone.js',
        '../../lib/js/bootstrap/js/bootstrap.min.js', 
        function() {
          google.load("maps", "3",{
                  callback: "window.loadSirius(runner)",
                  other_params: "libraries=geometry,drawing&sensor=false"
                });
          });
  };
}).call(this);