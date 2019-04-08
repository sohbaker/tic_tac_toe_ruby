require "human"

RSpec.describe Human do
  it "creates a new human with a mark" do
    human = Human.new("X")
    expect(human.mark).to eq("X")
  end
end
