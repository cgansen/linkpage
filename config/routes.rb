ActionController::Routing::Routes.draw do |map|

  map.click 'page/click_link/:id/:text', :controller => 'page', :action => 'click_link'
  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
end
