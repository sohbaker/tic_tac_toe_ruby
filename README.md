# Ruby Tic Tac Toe

## Tasks

### Task 1
Create a Human vs Human Tic Tac Toe game which can be played from the Command Line
- [x] Displays a board
- [x] Takes a user input from the players to place mark on the board
- [x] Game runs based on moves and evaluates whether the game is can continue
- [x] End of game message (knows who won or whether there was a tie)

### Task 2 
 - [x] Refactor Human vs Human Tic Tac Toe to allow a Human vs Computer option
 - [] Make the Computer player unbeatable

## Language
This application is written in [Ruby](https://ruby-doc.org/). 

## To get started
1. Clone this repository to your local machine as explained [here](https://help.github.com/articles/cloning-a-repository/)
2. Install gems needed to run the files by typing `$ bundle install` in terminal
3. Make sure to check that .DS_Store is listed in your `.gitignore` file so that it doesn't get pushed to GitHub.  

## Testing
You can manually run all tests using the command `$ rspec`  
Alternatively you can use the command `$ bundle exec guard` to launch RSpec in [Guard](https://github.com/guard/guard). Guard will watch your files as you work and automatically run the test/s relating to your file as you make changes
Further documentation [here](https://github.com/guard/guard-rspec) and installation guidance [here](https://collectiveidea.com/blog/archives/2017/02/09/guard-is-your-friend)

Tests are run in [RSpec](http://rspec.info/documentation/) and are found in the `spec` folder.
