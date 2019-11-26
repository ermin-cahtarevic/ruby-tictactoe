# frozen_string_literal: true

class TicTacToe
  attr_reader :current_player, :winner, :finished

  def initialize
    @board = Board.new
    @current_player = 'X'
    @finished = false
  end

  def play(move)
    return false unless (1..9).include? move

    move -= 1
    x = move / 3
    y = move % 3

    return false if @board.position_taken?(x, y)

    @board.move(x, y, @current_player)

    if @board.victory?
      @winner = @current_player
      @finished = true
    elsif @board.full?
      @finished = true
    else
      switch_player
    end

    true
  end

  def to_s
    @board.board.map do |row|
      "#{row[0] || '-'}|#{row[1] || '-'}|#{row[2] || '-'}\n"
    end.join
  end

  private

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end
end

class Board
  attr_reader :board
  def initialize
    @board = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end

  def full?
    @board.flatten.all?
  end

  def victory?
    lines = [
      [[0, 0], [0, 1], [0, 2]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]],
      [[0, 0], [1, 0], [2, 0]],
      [[0, 1], [1, 1], [2, 1]],
      [[0, 2], [1, 2], [2, 2]],
      [[0, 0], [1, 1], [2, 2]],
      [[2, 0], [1, 1], [0, 2]]
    ]

    lines.any? do |line|
      one = @board[line[0][0]][line[0][1]]
      two = @board[line[1][0]][line[1][1]]
      three = @board[line[2][0]][line[2][1]]
      one && one == two && two == three
    end
  end

  def position_taken?(row, column)
    !@board[row][column].nil?
  end

  def move(row, column, player)
    @board[row][column] = player
  end
end
