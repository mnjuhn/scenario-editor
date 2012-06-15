class window.aurora.MapLinkView extends Backbone.View
  @viewLinks = []
  @viewArrows = []
  
  initialize: (link, broker) -> 
    #Instantiate a directions service.
    renderOptions = {
      map: window.map,
      markerOptions: {visible: false},
      preserveViewport: true
    }
    this.directionsService = new google.maps.DirectionsService()
    this.directionsDisplay = new google.maps.DirectionsRenderer(renderOptions)
    this.begin =  window.aurora.Util.getLatLng link.get('begin').get('node')
    this.end = window.aurora.Util.getLatLng link.get('end').get('node')
    this.broker = broker
    this.broker.on('map:init', this.render, this)

  render: -> 
    #Create DirectionsRequest using DRIVING directions.
    request = {
      origin: this.begin,
      destination: this.end,
      travelMode: google.maps.TravelMode.DRIVING,
    }
    #Route the directions and pass the response to a
    #function to draw the full link for each step.
    self = this
    this.directionsService.route(request, (response, status) =>
      if (status == google.maps.DirectionsStatus.OK)
        warnings = $("#warnings_panel")
        warnings.innerHTML = "" + response.routes[0].warnings + ""
        self.displayArrow(response.routes[0].legs)
        self.directionsDisplay.setDirections(response)
        #add directionsDisplay object to static array of links for hiding/showing layers
        MapLinkView.viewLinks.push self.directionsDisplay

    )

  #Arrow Positoning calculations involve the following functions:
  #displayArrow, getArrowStep, getArrowPositionIndex, and getBearingOfArrow
  #displayArrow calcuates the angle of the arrow to display along the route
  displayArrow: (legs) ->
    
    #get the step along the route is about halfway
    arrow_step = this.getArrowStep(legs)
    #get the index of the latitude/longitude that is about halfway through the step
    lat_lng_index = this.getArrowPositionIndex(arrow_step)
    #get the arrows lat/lng from the path
    #It would be better to get the exact midpoint of the line using something like this:
    #google.maps.geometry.spherical.interpolate(legs[0].start_location, legs[0].end_location, .5)
    #The problem here is that this calculates the lat/lng midpoint of straight line between the points -- not along the route
    arrow_lat_lng_pos = arrow_step.path[lat_lng_index] 
    #angle the arrow towards this lat_lng - even if one step on route you still have begin and end lat/lng
    arrow_angle_to = arrow_step.path[lat_lng_index + 1]
    
    #calculate direction of arrow
    dir = this.getAngleOfArrow(arrow_lat_lng_pos,arrow_angle_to)
    self = this
    marker = new google.maps.Marker({
      position: arrow_lat_lng_pos,
      icon: new google.maps.MarkerImage('http://maps.google.com/mapfiles/dir_'+dir+'.png',
                  new google.maps.Size(24,24),
                  new google.maps.Point(0,0),
                  new google.maps.Point(12,12)
            ),
      map: window.map
    });
    #add marker to static array of arrows for hiding/showing layers
    MapLinkView.viewArrows.push marker
    marker

  #this moves through the steps array of the route to determine which step is about 
  #halfway through the leg
  getArrowStep: (legs) ->
    steps = legs[0].steps
    total_meters = 0
    for step,index in steps
      total_meters += step.distance.value
      arrow_step = step
      if(total_meters >= legs[0].distance.value / 2)
        break

    arrow_step
  
  #for the step parameter get the index of the middle
  #lat/lng
  getArrowPositionIndex: (step) ->
    Math.floor(step.path.length / 2)
  
  #this uses google spherical geometry functions to calculate the heading if our arrow.
  getAngleOfArrow: (pos, towards) ->
    dir = google.maps.geometry.spherical.computeHeading(pos, towards).toFixed(1);
    #round it to a multiple of 3 and correct unusable numbers
    dir = Math.round(dir/3) * 3;
    if (dir < 0)
      dir += 240
    if (dir > 117) 
      dir -= 120
    dir
  
################# The following handles the show and hide of link layers including the arrow heads
  @hideLinkOverlays: () ->
    _.each(viewLinks, (i) -> i.setMap(null))
    _.each(viewArrows, (i) -> i.setMap(null))
  
  @showLinkOverlays: () ->
    _.each(viewLinks, (i) -> i.setMap(window.map))
    _.each(viewArrows, (i) -> i.setMap(window.map))
