#!/usr/bin/env ruby

def valid_move?(move)
  (1..9).include? move
end

def winning_move?
  rand > 0.7
end

def draw_move?
  rand > 0.7
end

def display_board
  puts "Game board is displayed"
end

current_player = 'X'

display_board

while true
  print "Player #{current_player}, your next move choose a number (1-9)?: "
  move = gets.chomp.to_i
  if valid_move?(move)
    display_board
    if winning_move?
      puts "Player #{current_player} has won the game!"
      break
    elsif draw_move?
      puts "Game ended in a draw"
      break
    else
      current_player = current_player == "X" ? "O" : "X"
    end
  else
    puts "Invalid move!"
  end
end
