require "spec_helper"
require "computer"
require "board"

RSpec.describe Computer do
  let(:board) {Board.new(empty_board)}
  let(:computer) {Computer.new("O", board)}

  it "creates a new computer player with a mark" do
    expect(computer.mark).to eq("O")
  end
  
  it "selects an available move from the board" do
    expect(computer.get_move).should_not be_nil
  end

  it "blocks it's opponent from winning the game" do 
    x_wins_game_on_next_move = ["O", "X", 3, 4, 5, "O", 7, "X", 9]  
    board = Board.new(x_wins_game_on_next_move)
    computer = Computer.new("O", board)
    expect(computer.get_move).to eq(5)
  end
  
  it "plays a move to win the game when possible" do 
    o_wins_game_on_next_move = ["O", "X", 3, "O", 5, 6, 7, 8, "X"]
    board = Board.new(o_wins_game_on_next_move)
    computer = Computer.new("O", board)
    expect(computer.get_move).to eq(7)
  end
end
