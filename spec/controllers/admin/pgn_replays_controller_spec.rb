require File.dirname(__FILE__) + '/../../spec_helper'
require_dependency 'admin/pgn_replays_controller'
class Admin::PgnReplaysController < Admin::ResourceController; def rescue_action(e); raise e; end end

describe Admin::PgnReplaysController do
  # Uses Admin::ResourceController, built into Radiant
  dataset :users, :pgn_replays
  
  before :each do
    @game = PgnReplay.find(:first)
    login_as :admin
  end

  it "should require login" do
    logout
    lambda { get :index }.should                require_login
    lambda { get :show, :id => 1 }.should       require_login
    lambda { get :new }.should                  require_login
    lambda { post :create}.should               require_login
    lambda { get :edit, :id => 1 }.should       require_login
    lambda { put :update, :id => 1 }.should     require_login
    lambda { get :remove, :id => 1 }.should     require_login
    lambda { delete :destroy, :id => 1 }.should require_login
  end

  [:admin, :developer].each do |user|
    describe "#{user} user" do
      before :each do
        @game = PgnReplay.find(:first)
        login_as user
      end

      def redirects_to_index
        response.should be_redirect
        response.should redirect_to(admin_pgn_replays_path)
      end

      it 'should have access to the index action' do
        get :index
        response.should be_success
      end
      
      it 'should have access to the new action' do
        get :new
        response.should be_success
      end
      
      it 'should have access to the create action' do
        post :create, :pgn_replay => min_valid_pgn_replay_params
        redirects_to_index
      end
      
      it 'should have access to the edit action' do
        get :edit, :id => 1
        response.should be_success
      end
      
      it 'should have access to the update action' do
        put :update, :id => 1
        redirects_to_index
      end
      
      it "should have access to the remove action" do
        get :remove, :id => 1
        response.should be_success
      end
      
      it 'should have access to the destroy action' do
        delete :destroy, :id => 1
        redirects_to_index
      end
      
    end
  end
  
  [:existing, :non_admin].each do |user|
    describe "#{user} user" do
      before :each do
        login_as user
      end
  
      def redirects_to_pages
        response.should be_redirect
        response.should redirect_to(admin_pages_path)
        flash[:error].should == 'You must have developer privileges to perform this action.'
      end
  
      it 'should not have access to the index action' do
        get :index
      end
      
      it 'should not have access to the show action' do
        get :show, :id => 1
      end
      
      it 'should not have access to the new action' do
        get :new
      end
      
      it 'should not have access to the create action' do
        post :create, :pgn_replay => min_valid_pgn_replay_params
      end
      
      it 'should not have access to the edit action' do
        get :edit, :id => 1
      end
      
      it 'should not have access to the update action' do
        put :update, :id => 1
      end
  
      it 'should not have access to the remove action' do
        put :remove, :id => 1
      end
      
      it 'should not have access to the destroy action' do
        delete :destroy, :id => 1
      end
      
      after :each do
        redirects_to_pages
      end
    end
  end

  it "should redirect to the index after creation" do
    post :create, :pgn_replay => min_valid_pgn_replay_params
    response.should be_redirect
    response.should redirect_to(admin_pgn_replays_path)
  end

  it "should redirect to the index after update" do
    put :update, :id => @game.id
    response.should be_redirect
    response.should redirect_to(admin_pgn_replays_path)
  end

end
