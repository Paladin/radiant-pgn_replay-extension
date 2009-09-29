class PgnReplaysDataset < Dataset::Base
  
  def load
    create_record PgnReplay, :first,
    						:id => 1,
    						:title => 'White to play and win',
    						:tags => 'endgame',
    						:pgn_text => "[White \"M. Aster\"][Black \"P. Atzer\"][Event \"\"][Site \"\"][Date \"????.??.??\"][Round \"?\"][Result \"1-0\"][FEN \"8/3p4/8/2P5/P3k3/8/8/7K w - - 0 1\"] {The black king is inside the square of the white a-pawn, so it seems there is no way to force a queen.} 1. c6! {or is there?} (1.a5?? {The direct approach doesn\\'t work, because the black king has a direct path to the queening square} 1...Kd5 2.a6 (2.c6 {doesn\\'t work now, because of } 2...Kc6) 2...Kc6 3. a7 Kb7 {and the pawn is caught}) 1...dc6 (1...Kd5 2.cd7 Kd6 3.d8=Q) 2.a5 Kd5 3.a6 {Now the point of moving the other pawn first should be clear: black cannot continue on a straight path to the queening square because c6 is occupied by a black pawn. So black must detour around the pawn, and the Rule Of The Square tells us when that happens the white pawn will queen:} 3...Kc5 (3...Kd6 4.a7 Kc7 5.a8=Q) (3...c5 {to try and force a black queen is no better} 4.a7 c4 (4...Kc6 5.a8=Q) 5.a8=Q) 4.a7 Kb6 5.a8=Q "
  end
  
    helpers do
    def min_valid_pgn_replay_params
      { :title => 'Rene Descartes',
        :pgn_text => 'Cogito ergo sum'
      }  
    end
  end

end