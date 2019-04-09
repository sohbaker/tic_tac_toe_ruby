require "computer"

RSpec.describe Computer do
  it "creates a new computer with a mark" do
    computer = Computer.new("O")
    expect(computer.mark).to eq("O")
  end
  
  it "returns a random move" do 
    computer = Computer.new("O")
    expect(computer.get_move.empty?).to eq(false)
  end

end
