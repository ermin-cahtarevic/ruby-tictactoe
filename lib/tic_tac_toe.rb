#0   1   2
#|   |   |
#1 | 2 | 3 -- 0
#4 | 5 | 6 -- 1
#7 | 8 | 9 -- 2

class TicTacToe
  attr_reader :current_player, :winner

  def initialize
    @board = Board.new
    @current_player = "X"
    @finished = false
  end

  def play(move)
    return false unless (1..9).include? move
    move -= 1
    x = move / 3
    y = move % 3

    return false if @board.board[x][y]

    @board.board[x][y] = @current_player

    check_board

    @current_player = @current_player == "X" ? "O" : "X" unless @finished

    return true
  end

  def finished?
    @finished
  end

  def display
    @board.display
  end

  private

  def check_board
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

    if lines.any? { |line| @board.board[line[0][0]][line[0][1]] == @board.board[line[1][0]][line[1][1]] && @board.board[line[1][0]][line[1][1]] == @board.board[line[2][0]][line[2][1]] }
      @finished = true
      @winner = @current_player
    elsif @board.board.flatten.all?
      @finished = true
    end
  end
end

class Board
  attr_accessor :board
  def initialize
    @board = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end

  def display
    @board.each do |row|
      puts "#{row[0] ? row[0] : '-'}|#{row[1] ? row[1] : '-'}|#{row[2] ? row[2] : '-'}"
    end
  end
end

