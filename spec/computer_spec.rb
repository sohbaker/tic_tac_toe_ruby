require "spec_helper"
require "board"
require "human_double"
require "computer"

RSpec.describe Computer do
  let!(:board) { Board.new }
  let!(:computer) { Computer.new("O", board) }

  it "creates a new computer player with a mark" do
    expect(computer.mark).to eq("O")
  end
 
  it "blocks it's opponent from winning the game" do 
    opponent = HumanDouble.new("X", [2,8])
    moves = [1,6]
    board.mark_board(opponent.get_move, opponent.mark)
    board.mark_board(moves.shift, computer.mark)
    board.mark_board(opponent.get_move, opponent.mark)
    board.mark_board(moves.shift, computer.mark)

    expect(computer.get_move).to eq(5)
  end
  
  it "plays a move to win the game when possible" do 
    opponent = HumanDouble.new("X", [2,9])
    moves = [1,4]
    board.mark_board(opponent.get_move, opponent.mark)
    board.mark_board(moves.shift, computer.mark)
    board.mark_board(opponent.get_move, opponent.mark)
    board.mark_board(moves.shift, computer.mark)

    expect(computer.get_move).to eq(7)
  end
 
  it "selects a random move if there is no winning move or move to block" do
    allow(computer).to receive(:random_move)
    computer.get_move 

    expect(computer).to have_received(:random_move)
  end
end
