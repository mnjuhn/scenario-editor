// Generated by CoffeeScript 1.3.1
(function() {

    sirius_jasmine_specs = ['BeginSpec', 'ControllerSpec', 'DensitySpec', 
			    'EditorNodeViewSpec', 'EndSpec', 'EventSpec', 
			    'InputSpec', 'IntersectionSpec', 'LinkSpec',
			    'NodeSpec', 'OutputSpec', 'OdSpec', 'ScenarioSpec'];
  
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
    return head.js('lib/jasmine-1.2.0/jasmine.js','lib/jasmine-1.2.0/jasmine-html.js', 'lib/jasmine-jquery.js', "spec/SpecHelper.js", function() {
      var class_paths;
      class_paths = _.map(sirius_jasmine_specs, function(cname) {
          return "spec/" + cname + ".js";
      });
      class_paths.push(after);
      return head.js.apply(this, class_paths);
    });
  };
  
  window.load_sirius = function() {
    return head.js("../js/Sirius.js", '../js/menu-data.js', 'scenario-xml.js', function() {
      return load_sirius_classes(function() {
          return load_jasmine_specs_templates(function() {
            xml = $.parseXML($a.fileText);
            $a.scenario = $a.Scenario.from_xml($(xml).children());
 
            _.templateSettings = {interpolate : /\{\{(.+?)\}\}/g }
            var jasmineEnv = jasmine.getEnv();
            jasmineEnv.updateInterval = 1000;
            
            var htmlReporter = new jasmine.HtmlReporter();
            
            jasmineEnv.addReporter(htmlReporter);
            
            jasmineEnv.specFilter = function(spec) {
              return htmlReporter.specFilter(spec);
            };
            
            function execJasmine() {
              jasmineEnv.execute();
            }
            execJasmine();
          });
        });
    });
  };

  head.js('https://www.google.com/jsapi', '../../libs/js/jquery-1.7.1.js', '../../libs/js/jquery-ui-1.8.21/js/jquery-ui-1.8.21.min.js', '../../libs/js/underscore.js', '../../libs/js/backbone.js', '../../libs/js/bootstrap/js/bootstrap.min.js', function() {
    return google.load("maps", "3", { 
      callback: "window.load_sirius()",
      other_params: "libraries=geometry,drawing&sensor=false"
    });
  });

}).call(this);
