class CreatePgnReplays < ActiveRecord::Migration
  def self.up
    create_table :pgn_replays do |t|
      t.text :title
      t.text :pgn_text
      t.text :tags

      t.timestamps
    end
  end

  def self.down
    drop_table :pgn_replays
  end
end
