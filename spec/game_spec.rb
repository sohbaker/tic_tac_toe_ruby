require "game"
require "pseudo_moves"
require "display_double"

RSpec.describe Game do
  it "switches the player" do
    game = Game.new
    game.complete_move(1)
    game.toggle_player
    expect(game.assign_mark).to eq("O")
  end

  it "knows that the game can continue" do
    game = Game.new
    game.complete_move(1)
    game.complete_move(2)
    expect(game.over?).to eq(false)
  end

  it "knows the game has ended with a tie" do
    moves = PseudoMoves::TIED_GAME_SEQUENCE
    game = Game.new
    until moves.empty?
      game.complete_move(moves.shift)
      game.toggle_player
      game.assign_mark
    end
    expect(game.is_a_tie?).to eq(true)
  end

  it "knows when a player has won the game" do
    moves = PseudoMoves::X_WINS_SEQUENCE
    game = Game.new
    until moves.empty?
      game.complete_move(moves.shift)
      if !game.over?
        game.toggle_player
      end
    end
    expect(game.player_wins?(game.mark)).to be(true)
  end

  it "can get a move from a human player" do
    game = Game.new
    game.instance_variable_set(:@display, DisplayDouble.new(["1"]))

    expect(game.ask_for_move("human")).to eq("1")
  end

  it "can get a move from a computer player" do
    game = Game.new

    expect(game.ask_for_move("computer")).to eq("1")
  end

  it "assigns the human player the mark 'X'" do
    game = Game.new

    expect(game.assign_mark).to eq("X")
  end

  it "retrieves a new move from computer player if their move is invalid" do
    game = Game.new
    game.check_move("1")
    game.toggle_player
    game.assign_mark
    game.check_move("1")

    expect(game.board.board_array).to eq(["X", "O", "3", "4", "5", "6", "7", "8", "9"])
  end
end
