class PgnReplay < ActiveRecord::Base
  validates_presence_of :pgn_text, :message => 'required'
  validates_presence_of :title, :message => 'required'
  
  def puzzle?
    if(pgn_text.grep( "/\[ ?FEN ?\"/m"))
      puzzle = true
    else
      puzzle = false
    end
    puzzle
  end
  
  def reference
    white = pgn_text.scan( /\[ *(White|WHITE) +"([^"]*)/)[0][1]
    black = pgn_text.scan( /\[ *(Black|BLACK) +"([^"]*)/)[0][1]
    year = pgn_text.scan( /\[ *(White|WHITE) +"([^"]*)/)[0][1].scan(/[0-9]{4}/)[0]
    site = pgn_text.scan( /\[ *(Site|SITE) +"([^"]*)/)[0][1]
    reference=""
    unless (white.blank? || black.blank?)
      reference += white.strip + " - " + black.strip
    end
    unless (year.blank?)
      reference += ", " + year.strip
    end
    unless (site.blank?)
      reference += ", " + site.strip
    end
    reference
  end
end
