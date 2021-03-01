[![Build Status](https://travis-ci.org/Jimjule/TicTacToe-Ruby.svg?branch=master)](https://travis-ci.org/Jimjule/TicTacToe-Ruby)

# TicTacToe-Ruby

A 'Tic-Tac-Toe' Gem written in Ruby. Can be run in irb, or used with an API like https://github.com/Jimjule/tictactoe_jules_console_api/

# Installation

- Clone this repo to your directory
- Run `bundle` in the project root

# Run

- Navigate to the project root
- Run `irb`
- `require ./lib/tictactoe_jules`

# Testing

- Navigate to the project root
- Run `rspec`
- Tests are located in the 'spec' folder, and end in 'spec.rb'

# Building the Gem

- In the project root
- Run `gem build tictactoe_jules.gemspec`
- You should now have a file called `tictactoe_jules-X.X.X.gem`, replacing version numbers as appropriate, which you can install and require in a project