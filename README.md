# Ruby Tic Tac Toe
A simple ruby implementation of Tic Tac Toe

## Usage
To run the game make sure to give execute permission to the main.rb

    chmod +x bin/main.rb

After that you can start the game by running

    ./bin/main.rb

## Instructions

Tic Tac Toe is a two player game (player 'X' and player 'O').

Each cell of the board is represented by a number from 1 to 9, as shown below:

    1|2|3
    -+-+-
    4|5|6
    -+-+-
    7|8|9

The game will ask for a cell number representing the current player's move.

Unless one player makes a winning move or the board gets full (a draw), the game will ask for the next player move.

A winning move consists on getting 3 moves in a single line of the board (whether horizontal, vertical or diagonal).

For example, the following board shows a vertical line winning move for the player X:

    X| |X
    -+-+-
    X|O|
    -+-+-
    X| |O
