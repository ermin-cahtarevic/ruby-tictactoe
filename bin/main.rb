#!/usr/bin/env ruby

# game = TicTacToe.new

while true #!game.finished?
  #game.display
  puts "Game board is displayed..."
  print "Current player, your next move choose a number (1-9)?: "
  move = gets.chomp.to_i
  #puts "Invalid move" unless game.play(move)
  puts "Your moved is played"

  # Until the game logic is implemented, we just simulate the game finishing at random
  break if rand > 0.7
end

# if game.winner
#   "Winner is current player"
# else
#   "Game finished in a draw"
puts rand > 0.5 ? "The winner is X" : "Game ended in a draw"
