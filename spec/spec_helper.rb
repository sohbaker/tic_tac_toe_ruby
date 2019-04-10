# Allows files in lib to be required and guard to run tests
$: << File.join(File.dirname(__FILE__), "..", "lib")

# creates a coverage report
require "simplecov"
SimpleCov.start

require "board"
require "game"
require "display"
require "computer"

def x_wins_sequence
  ["1", "4", "2", "5", "3"]
end

def tied_game_sequence
  ["9", "5", "1", "6", "4", "7", "3", "2", "8"]
end

def computer_player
  ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
end

def empty_board
  ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
end

def x_wins_on_next_move
  ["O", "X", "3", "4", "5", "O", "7", "X", "9"]
end

def o_wins_on_next_move
  ["O", "X", "3", "O", "5", "6", "7", "8", "X"]
end

def tied_game
  ["X", "X", "O", "O", "X", "X", "X", "O", "O"]
end

def player_has_won
  ["X", "O", "O", "X", "5", "6", "X", "8", "9"]
end
