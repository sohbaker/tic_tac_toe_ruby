# Allows files in lib to be required in any spec file
$: << File.join(File.dirname(__FILE__), "..", "lib")

require "board"
require "game"
require "player"
require "display"
