class Admin::PgnReplaysController < Admin::ResourceController
  model_class PgnReplay
  login_required
  only_allow_access_to :index, :show, :new, :create, :edit, :update, :remove, :destroy, 
    :when => [:admin, :developer],
    :denied_url => "/admin/pages",
    :denied_message => 'You must have developer privileges to perform this action.'
    
  def index
    @games = PgnReplay.find( :all )
  end
end
