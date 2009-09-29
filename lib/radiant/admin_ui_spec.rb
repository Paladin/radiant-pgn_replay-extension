require File.dirname(__FILE__) + "/../../spec_helper"
require File.dirname(__FILE__) + "/../../../pgn_replay_extension"

describe Radiant::AdminUI do
  before :each do
    @admin = Radiant::AdminUI.instance
  end
  
  it "should have a settings Region Set" do
    @admin.should respond_to(:pgn_replay)
  end
  
  it "should should have regions for the 'index'" do
    @admin.pgn_replay.index.should_not be_nil
  end
  
  it "should have 'top, list, bottom' regions in the 'index main' region" do
    @admin.pgn_replay.index.main.should == %w{top list bottom}
  end
end