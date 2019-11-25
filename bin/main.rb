#!/usr/bin/env ruby

require_relative '../lib/tic_tac_toe'

game = TicTacToe.new

while !game.finished?
  game.display
  print "Player #{game.current_player}, your next move choose a number (1-9)?: "
  move = gets.chomp.to_i
  puts "Invalid move" unless game.play(move)
end

game.display
puts game.winner ? "The winner is X" : "Game ended in a draw"
