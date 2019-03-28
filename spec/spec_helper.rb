# Allows files in lib to be required and guard to run tests
$: << File.join(File.dirname(__FILE__), "..", "lib")

# creates a coverage report
require "simplecov"
SimpleCov.start

require "board"
require "game"
require "display"
require "computer"
