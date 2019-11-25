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
puts game.winner ? "The winner is #{game.winner}" : "Game ended in a draw"

def display
  @board.each do |row|
    puts "#{row[0] ? row[0] : '-'}|#{row[1] ? row[1] : '-'}|#{row[2] ? row[2] : '-'}"
  end
end
