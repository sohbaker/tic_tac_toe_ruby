require "computer"

RSpec.describe Computer do
  it "creates a new computer with a mark" do
    computer = Computer.new("x")
    expect(computer.mark).to eq("X")
  end
end
