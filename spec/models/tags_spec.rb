require File.dirname(__FILE__) + '/../spec_helper'

describe "PgnReplay::Tags" do
  dataset :pages, :pgn_replays
  
  describe "<r:pgn>" do
    it "should render a pgn puzzle" do
      expected = %{<section id="position" class="the_position"><h1>White to play and win</h1><div id="positionA-container" class="the_board"></div><a class="caption" href="#">Show Solution</a><a href="http://chesstempo.com/pgn-viewer.html" style="display: block;font-size:70%;text-align:center;">About the ChessTempo viewer</a><div id="positionA-moves" class="the_moves"></div></section><script type="text/javascript">
new PgnViewer({
boardName: 'positionA',
pgnString: '[White "M. Aster"][Black "P. Atzer"][Event ""][Site ""][Date "????.??.??"][Round "?"][Result "1-0"][FEN "8/3p4/8/2P5/P3k3/8/8/7K w - - 0 1"] {The black king is inside the square of the white a-pawn, so it seems there is no way to force a queen.} 1. c6! {or is there?} (1.a5?? {The direct approach doesn\\\\'t work, because the black king has a direct path to the queening square} 1...Kd5 2.a6 (2.c6 {doesn\\\\'t work now, because of } 2...Kc6) 2...Kc6 3. a7 Kb7 {and the pawn is caught}) 1...dc6 (1...Kd5 2.cd7 Kd6 3.d8=Q) 2.a5 Kd5 3.a6 {Now the point of moving the other pawn first should be clear: black cannot continue on a straight path to the queening square because c6 is occupied by a black pawn. So black must detour around the pawn, and the Rule Of The Square tells us when that happens the white pawn will queen:} 3...Kc5 (3...Kd6 4.a7 Kc7 5.a8=Q) (3...c5 {to try and force a black queen is no better} 4.a7 c4 (4...Kc6 5.a8=Q) 5.a8=Q) 4.a7 Kb6 5.a8=Q ' });
</script>}
      pages(:home).should render('<r:pgn />').as(expected)
    end
  end
  
  describe "<r:pgn boardName=\"myPosition\" newLineForEachmainMove=\"false\" />" do
    it "should render a pgn puzzle" do
      expected = %{<section id="position" class="the_position"><h1>White to play and win</h1><div id="myPosition-container" class="the_board"></div><a class="caption" href="#">Show Solution</a><a href="http://chesstempo.com/pgn-viewer.html" style="display: block;font-size:70%;text-align:center;">About the ChessTempo viewer</a><div id="myPosition-moves" class="the_moves"></div></section><script type="text/javascript">
new PgnViewer({
newLineForEachMainMove: false,
boardName: 'myPosition',
pgnString: '[White "M. Aster"][Black "P. Atzer"][Event ""][Site ""][Date "????.??.??"][Round "?"][Result "1-0"][FEN "8/3p4/8/2P5/P3k3/8/8/7K w - - 0 1"] {The black king is inside the square of the white a-pawn, so it seems there is no way to force a queen.} 1. c6! {or is there?} (1.a5?? {The direct approach doesn\\\\'t work, because the black king has a direct path to the queening square} 1...Kd5 2.a6 (2.c6 {doesn\\\\'t work now, because of } 2...Kc6) 2...Kc6 3. a7 Kb7 {and the pawn is caught}) 1...dc6 (1...Kd5 2.cd7 Kd6 3.d8=Q) 2.a5 Kd5 3.a6 {Now the point of moving the other pawn first should be clear: black cannot continue on a straight path to the queening square because c6 is occupied by a black pawn. So black must detour around the pawn, and the Rule Of The Square tells us when that happens the white pawn will queen:} 3...Kc5 (3...Kd6 4.a7 Kc7 5.a8=Q) (3...c5 {to try and force a black queen is no better} 4.a7 c4 (4...Kc6 5.a8=Q) 5.a8=Q) 4.a7 Kb6 5.a8=Q ' });
</script>}
      pages(:home).should render('<r:pgn boardName="myPosition" newLineForEachMainMove="false" />').as(expected)
    end
  end

  describe "<r:pgn game=2>" do
    it "should render complete game #2" do
      expected = %{<section id="position" class="the_position"><h1>White to play and win</h1><div id="positionA-container" class="the_board"></div><a class="caption" href="#">Show Solution</a><a href="http://chesstempo.com/pgn-viewer.html" style="display: block;font-size:70%;text-align:center;">About the ChessTempo viewer</a><div id="positionA-moves" class="the_moves"></div></section><script type="text/javascript">
new PgnViewer({
boardName: 'positionA',
pgnString: '[Event "USSR"] [Site "?"] [Date "1988.??.??"] [Round "?"] [White "Razuvaev"] [Black "Geller"] [Result "1-0"] [ECO "E04"] [Annotator "Kopylov Michael"] [PlyCount "29"] [SourceDate "2009.06.14"] {Let\'s start with the following nice miniature. Complete domination at the end and Black resigned after 15 moves.} 1. d4 d5 2. c4 e6 3. Nf3 Nf6 4. g3 dxc4 5. Bg2 a6 6. O-O c5 $6 ({At this point, Black usually plays} 6... b5) ({or} 6... Nc6) 7. dxc5 Qxd1 (7... Bxc5 {is hardly any better:} 8. Qxd8+ Kxd8 9. Ne5 Ke7 10. Nd2 $14) 8. Rxd1 Bxc5 9. Ne5 $1 Nbd7 10. Nxc4 Ra7 ({The pressure exerted by the Bg2 is so strong that Black is practically forced into this clumsy rook move.} 10... O-O {makes little difference.} 11. Nc3 Ra7 12. Na4 $16 {[%csl Ra7] }) 11. Nc3 b5 12. Nd6+ Ke7 $6 ({There was the somewhat better} 12... Bxd6 13. Rxd6 Ke7 (13... Bb7 $2 14. Be3 $18) {, but after} 14. Rd1 $14 {Black still has major problems.}) 13. Nce4 Nxe4 14. Nxe4 Rc7 15. Bd2 $1 $18 {#} (15. Bd2 {After} Bb7 (15... Bb6 16. Bb4+) (15... f5 16. Nxc5 Nxc5 17. Ba5 Rd7 18. Bb4 $18) 16. Ba5 Rcc8 17. Rxd7+ Kxd7 18. Nxc5+ Rxc5 19. Bxb7 $18 {Black is completely lost, so his resignation was hardly premature.}) 1-0' });
</script>}
      pages(:home).should render('<r:pgn game=2 />').as(expected)
    end
  end

  describe "<r:pgn tag=\"alekhine-bogoljubov\" >" do
    it "should render complete game Alekhine-Bogoljubov" do
      expected = %{<section id="position" class="the_position"><h1>White to play and win</h1><div id="positionA-container" class="the_board"></div><a class="caption" href="#">Show Solution</a><a href="http://chesstempo.com/pgn-viewer.html" style="display: block;font-size:70%;text-align:center;">About the ChessTempo viewer</a><div id="positionA-moves" class="the_moves"></div></section><script type="text/javascript">
new PgnViewer({
boardName: 'positionA',
pgnString: '[Event "Warsaw m"] [Site "Warsaw"] [Date "1943.??.??"] [Round "2"] [White "Alekhine, Alexander"] [Black "Bogoljubow, Efim"] [Result "1-0"] [ECO "E00"] [Annotator "Kopylov Michael"] [PlyCount "63"] [EventDate "1943.??.??"] [EventType "match"] [EventRounds "2"] [EventCountry "POL"] [Source "ChessBase"] [SourceDate "2000.11.22"] {A masterpiece signed Alexander Alekhine demonstrates what can happen in a Catalan ending if Black castles queenside.} 1. d4 d5 2. c4 e6 3. Nf3 Nf6 4. g3 dxc4 5. Qa4+ Qd7 6. Qxc4 Qc6 7. Nbd2 Qxc4 8. Nxc4 Bb4+ ({Nor does} 8... b6 { achieve equality for Black.} 9. Bg2 Bb7 10. O-O Nbd7 11. Bd2 $1 Be7 12. Rfc1 c5 13. Bf4 O-O 14. Bd6 $14) 9. Bd2 Bxd2+ 10. Ncxd2 $6 ({A better move is} 10. Nfxd2 $142 {see Botvinnik - Vidmar, Groningen 1946. The idea behind 10.Nfxd2 is that after 10...Bd7 11.Bg2 Bc6 White can play 12.e4!, after which Black is once more put under positional pressure.}) 10... Nc6 $2 (10... Bd7 $1 11. Bg2 ( 11. Ne5 Nc6 12. Nxd7 Nxd7 $11) 11... Bc6 $11) 11. Bg2 Bd7 12. O-O O-O-O 13. Rac1 Rhe8 14. Nc4 Re7 15. a3 Be8 16. Rfd1 Nd5 17. b4 $16 {[%cal Gc1c8,Gg2b7] #} Nb6 18. b5 Nb8 19. Nxb6+ axb6 20. a4 f6 21. Bh3 Bd7 22. Nd2 Rf8 23. Bg2 c6 24. Nc4 Kc7 25. e4 cxb5 26. axb5 Bxb5 27. d5 $1 {decides the game quickly.} exd5 28. Na3+ Bc6 29. exd5 Rd7 30. Nb5+ Kd8 31. dxc6 bxc6 32. Nd4 1-0' });
</script>}
      pages(:home).should render('<r:pgn tag="alekhine-bogoljubov" />').as(expected)
    end
  end

end