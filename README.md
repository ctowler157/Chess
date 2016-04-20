#Ruby Chess#

This was started with [Charles](https://github.com/ckuang) but completed alone.

## To get started
  <p>
    <em>Make sure you have Ruby installed. A good tutorial can be found here <a href="http://installrails.com/steps">Ruby Installation Tutorial</a></em>
  </p>
  <ol>
    <li>Download the ruby file <a href="chess.zip">here</a></li>
    <li>Unzip the file</li>
    <li>Navigate to the folder in terminal</li>
    <li>Run the command <code>$ bundle install </code> in the terminal to install the colorize gem</li>
    <li>
      <p>
        Run the command <code>$ ruby chess.rb </code> to start the game.  You should see a title screen
      </p>
      <img src="assets/images/welcome_screen.png" />
    </li>
    <li>Enter the number of players and press enter to begin.</li>
  </ol>

## Gameplay
<p>
  <em>Gameplay is controlled using the arrow keys and the enter key, though you will occasionally use the keyboard when prompted. You can press Ctrl + C at any point to exit the game.</em>
</p>

### Making a move
<ul>
  <li>
    <p>
      Use the arrow keys to navigate the cursor, which is blue.  Press enter when you have navigated to the piece you wish to move.  If you press enter on an opponents piece or an empty square, the game will display a warning message and you will need to select again.
    </p>
    <img src="assets/images/select_move_1.png" />
  </li>
  <li>
    <p>
      Selecting a piece with enter will turn that piece's square red.  You can now navigate the cursor to select the position you wish to move the piece to.  Selecting an invalid move will cause the game to display a warning and you will need to select a piece again.
    </p>
    <img src="assets/images/select_move_2a.png" />
    <img src="assets/images/select_move_2b.png" />
  </li>
  <li>
    <p>
      The move will then pass to the opposing player.
    </p>
    <img src="assets/images/select_move_3.png" />
  </li>
  <li>
    <p>
      If a pawn makes it to the last row on the board, you will be prompted to promote it into another piece.  You have the choice to select either a Queen, a Knight, a Rook, or a Bishop.  If you select either the Rook or the Bishop, the game will correct your mistake and give you a Queen.
    </p>
    <img src="assets/images/promotion.png" alt="$ />
  </li>
</ul>

### Check, Checkmate, and winning the game
<ul>
  <li>
    <p>
      If a move threatens a player's King, the game will display a warning at the bottom to reflect it.  The player's moves will be limited to those that remove the threat to the King.
    </p>
    <img src="assets/images/check.png" />
  </li>
  <li>
    <p>
      If a player is in check and has no possible moves to remove the threat, that player is in checkmate.  The opposing player wins, and the game ends.
    </p>
    <img src="assets/images/check_mate.png" />
  </li>
</ul>
