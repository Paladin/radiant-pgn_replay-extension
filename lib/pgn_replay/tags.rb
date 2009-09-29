module PgnReplay::Tags
  include Radiant::Taggable

  desc %{
    Renders a random PGN game from the PGN table.
    
    *Usage*:

    <pre><code><r:pgn [attribute="value" ... ] /></code></pre>
  }
  tag "pgn" do |tag|
    game = PgnReplay.random()
    game.pgn_text.gsub!(/[']/, '\\\\\'')
    tag.attr["boardName"] = "positionA" if tag.attr["boardName"].blank?
    result = '<section id="position" class="the_position">'
    result << "<h1>#{game.title}</h1>"
    result << "<div id=\"#{tag.attr['boardName']}-container\" class=\"the_board\"></div>"
    result << '<a class="caption" href="#">Show Solution</a>'
    result << '<a href="http://chesstempo.com/pgn-viewer.html" style="display: block;font-size:70%;text-align:center;">About the ChessTempo viewer</a>'
    result << "<div id=\"#{tag.attr['boardName']}-moves\" class=\"the_moves\"></div>"
    result << '</section>'
    result << "<script type=\"text/javascript\">\n"
    result << "new PgnViewer({\n"
    tag.attr.each do | attribute, value |
      result << "#{attribute}: "
      result << case value
        when /^\d+$|^false$|^False$|^FALSE$|^TRUE$|^True$|^true$/ then "#{value},\n"
        else "'#{value}',\n"
      end
    end
    result << "pgnString: '#{game.pgn_text}' });\n"
    result << '</script>'
  end

end