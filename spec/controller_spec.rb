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

    it "allows the second player to make their move" do
        controller = Controller.new
        controller.take_turn(2)
        controller.take_turn(3)
        expect(controller.prints_board).to eq("""
        1 | X | O
        ---------
        4 | 5 | 6
        ---------
        7 | 8 | 9""")
    end

    it "does not switch the player if an invalid move is selected" do 
        controller = Controller.new
        controller.take_turn(2)
        controller.take_turn(2)
        expect(controller.current_player).to eq('O')
    end
end