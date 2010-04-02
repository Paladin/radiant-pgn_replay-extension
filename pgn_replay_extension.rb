# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class PgnReplayExtension < Radiant::Extension
  version "0.4"
  description "Provides a PGN game or puzzle file to the page"
  url "http://www.paladinweb.net/radiant/pgn_replay"
  
   define_routes do |map|
     map.namespace :admin, :member => { :remove => :get } do |admin|
       admin.resources :pgn_replays
     end
   end
  
  def activate
    Page.send :include, PgnReplay::Tags
    admin.tabs.add "PGN", "/admin/pgn_replays", :after => "Layouts"
  end
  
  def deactivate
    admin.tabs.remove "PGN"
  end
  
end
