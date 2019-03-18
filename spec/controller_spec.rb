require 'controller'

RSpec.describe Controller do
    it "allows player 'X' to make their first move" do
        controller = Controller.new
        controller.take_turn(2)
        expect(controller.prints_board).to eq("""
        1 | X | 3
        ---------
        4 | 5 | 6
        ---------
        7 | 8 | 9""")
    end 
end