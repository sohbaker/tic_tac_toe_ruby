# Allows files in lib to be required and guard to run tests
$: << File.join(File.dirname(__FILE__), "..", "lib")

# creates a coverage report
require "simplecov"
SimpleCov.start

require "board"
require "game"
require "display"
require "computer"

def empty_board
  ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
end

def tied_game
  ["X", "X", "O", "O", "X", "X", "X", "O", "O"]
end

def player_has_won
  ["X", "O", "O", "X", "5", "6", "X", "8", "9"]
end
