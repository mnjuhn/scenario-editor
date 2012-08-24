# The view class for each link child item in the tree view. Each child item
# is <li> tag with an anchor surrounding the name.
class window.sirius.TreeChildItemDemandLinkView extends window.sirius.TreeChildItemLinkView
  $a = window.sirius
  showContext: (e) =>
    if !@added_menu_item
      @targets[0].get('contextMenu').options.menuItems.push
        label: 'View Demands'
        className: 'context_menu_item'
        event: =>
          dviz = new $a.DemandVisualizer(@targets[0].get('demand'))
          $('body').append(dviz.el)
          dviz.render()
          $(dviz.el).dialog('open')
      @added_menu_item = true
    super