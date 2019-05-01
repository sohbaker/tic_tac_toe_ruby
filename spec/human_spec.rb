require "human"
require "stub_display"

RSpec.describe Human do
  it "creates a new human with a mark" do
    human = Human.new("X", StubDisplay.new)
    expect(human.mark).to eq("X")
  end
end
