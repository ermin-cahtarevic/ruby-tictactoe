# frozen_string_literal: true

require './lib/tic_tac_toe'

describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'initializes an empty board' do
      expect(board.board).to eql([
                                   [nil, nil, nil],
                                   [nil, nil, nil],
                                   [nil, nil, nil]
                                 ])
    end
  end

  describe '#full?' do
    it 'returns false for empty board' do
      expect(board.full?).to be false
    end

    it 'returns true for full board' do
      (0..2).each do |i|
        (0..2).each do |j|
          board.move(i, j, 'X')
        end
      end
      expect(board.full?).to be true
    end
  end

  describe '#victory?' do
    it 'returns true for a vertical winning line' do
      [[0, 0], [0, 1], [0, 2]].each { |move| board.move(move[0], move[1], 'X') }
      expect(board.victory?).to be true
    end

    it 'returns true for a horizontal winning line' do
      [[0, 0], [1, 0], [2, 0]].each { |move| board.move(move[0], move[1], 'X') }
      expect(board.victory?).to be true
    end

    it 'returns true for a diagonal winning line' do
      [[0, 0], [1, 1], [2, 2]].each { |move| board.move(move[0], move[1], 'X') }
      expect(board.victory?).to be true
    end

    it 'returns false for no winning move' do
      [[0, 1], [1, 1], [1, 2]].each { |move| board.move(move[0], move[1], 'X') }
      expect(board.victory?).to be false
    end
  end

  describe '#position_taken?' do
    it 'returns true if position is taken' do
      board.move(0, 1, 'X')
      expect(board.position_taken?(0, 1)).to be true
    end

    it 'returns false if position is empty' do
      expect(board.position_taken?(2, 2)).to be false
    end
  end

  describe '#move' do
    it 'fills out a position according to the given parameters' do
      board.move(0, 0, 'X')
      expect(board.board[0][0]).to eql('X')
    end
  end
end
