require 'controller'

RSpec.describe Controller do
    it "allows player 'X' to make their first move" do
        controller = Controller.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        controller.take_turn(2)
        expect(controller.prints_board).to eq("""
        1 | X | 3
        ---------
        4 | 5 | 6
        ---------
        7 | 8 | 9""")
    end 

    it "allows the second player to make their move" do
        controller = Controller.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
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
        controller = Controller.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        controller.take_turn(2)
        controller.take_turn(2)
        expect(controller.current_player).to eq('O')
    end

    it "checks if the game can continue and returns false when the game has ended due to a tie" do
        controller = Controller.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) 
        controller.take_turn(2)
        controller.take_turn(1)
        controller.take_turn(3)
        controller.take_turn(5)
        controller.take_turn(4)
        controller.take_turn(6)
        controller.take_turn(8)
        controller.take_turn(7)
        controller.take_turn(9)
        expect(controller.can_continue_playing()).to eq(false)
    end

    it "checks if the game can continue and returns false when the game has ended because a player has won" do
        controller = Controller.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) 
        controller.take_turn(1)
        controller.take_turn(4)
        controller.take_turn(2)
        controller.take_turn(6)
        controller.take_turn(3)
        p controller.prints_board
        expect(controller.can_continue_playing()).to eq(false)
    end
end