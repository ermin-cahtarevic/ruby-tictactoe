#!/usr/bin/env ruby

# frozen_string_literal: true



require_relative '../lib/tic_tac_toe'

game = TicTacToe.new

until game.finished
  puts game.to_s
  print "Player #{game.current_player}, your next move choose a number (1-9)?: "
  move = gets.chomp.to_i
  puts 'Invalid move' unless game.play(move)
end

puts game.to_s
puts game.winner ? "The winner is #{game.winner}" : 'Game ended in a draw'
