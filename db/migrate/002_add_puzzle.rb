class AddPuzzle < ActiveRecord::Migration
  def self.up
    add_column "pgn_replays", "puzzle", :boolean
  end

  def self.down
    remove_column "pgn_replays", "puzzle"
  end
end
