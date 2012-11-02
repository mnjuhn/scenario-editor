# This class is used to manage our link models. 
class window.sirius.LinkListCollection extends Backbone.Collection
  $a = window.sirius
  model: $a.Link
  
  # set up the event that calls for the addition of a link to the collection
  # register the links begin and end nodes with the remove method on the model
  # node
  initialize: (@models)->
    $a.broker.on("map:redraw_link", @reDrawLink, @)
    $a.broker.on('link_coll:add', @addLink, @)
    @forEach((link) => 
        link.get('begin').get('node').bind('remove', => @removeNode(link, 'begin'))
        link.get('end').get('node').bind('remove', => @removeNode(link, 'end'))
    )

    @forEach((link) -> link.bind('remove', => @destroy))
    @on('links:remove', @removeLink, @)
  
  # addLink takes the begin node and end node ids, sets up the appropriate
  # begin and end node objects, creates the link and adds it to the collection
  addLink: (args) ->
    link = new window.sirius.Link()
    begin = new window.sirius.Begin()
    begin.set('node_id', args.begin.get('id'))
    begin.set('node', args.begin)
    
    end = new window.sirius.End()
    end.set('node_id', args.end.get('id'))
    end.set('node', args.end)
    
    link.set('begin', begin)
    link.set('end', end)
    @add(link)
    link
  
  # This removes either the begin or end node from the link if the node
  # itself has been removed from the node collection
  removeNode: (link, type) ->
    link.set(type, null)
  
  # removeLink removes the link from the collection and takes it off the 
  # map.
  removeLink: (linkID) ->
    link = _.filter(@models, (link) -> link.cid is linkID)
    @remove(link)
  
  # This is called when a link browser is created in order to return
  # the desired column data for the table.
  getBrowserColumnData: () ->
    @models.map((link) -> 
                  [
                    link.get('id'),
                    link.get('name'),
                    link.get('road_name'),
                    link.get('type'),
                    link.get('lanes'),
                    link.get('begin').get('node').get('name'),
                    link.get('end').get('node').get('name')
                  ]
                )
  
  # This method is triggered when a node is dragged. First find the links whose
  # begin or end node is effected and then remove them from the map and re-add
  # them so they are redrawn
  reDrawLink: (node) ->
    links = _.filter(@models, (link) -> 
                        link.get('begin').get('node') is node or 
                        link.get('end').get('node') is node
            )
    _.each(links, (link) => 
                    @remove(link)
                    @add(link)
          )
    links
    