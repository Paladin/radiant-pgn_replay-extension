require File.dirname(__FILE__) + '/../spec_helper'

describe PgnReplay do
  dataset :pgn_replays

  before(:each) do
    @first_position = PgnReplay.find(:first)
  end

  it "first game should be valid" do
    @first_position.should be_valid
  end
  it "first game should be a puzzle" do
    @first_position.should be_puzzle
  end
  
end
