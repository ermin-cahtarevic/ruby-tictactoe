# frozen_string_literal: true

require './lib/tic_tac_toe'

describe TicTacToe do
  let(:game) { TicTacToe.new }

  describe '#initialize' do
    it 'should set the current player as X' do
      expect(game.current_player).to eql('X')
    end

    it 'should set finished to false' do
      expect(game.finished).to be false
    end
  end

  describe '#play' do
    it 'returns false if the input number is out of range' do
      expect(game.play(10)).to be false
    end

    it 'returns false if the poisition is already taken' do
      game.play(1)
      expect(game.play(1)).to be false
    end

    it 'returns true if player plays valid move' do
      expect(game.play(5)).to be true
    end

    it 'updates the winner' do
      game.play(1)
      game.play(5)
      game.play(3)
      game.play(7)
      game.play(2)

      expect(game.winner).to eql('X')
    end

    it 'changes the current player after a valid move' do
      game.play(4)
      expect(game.current_player).to eql('O')
    end

    it "doesn't change the player after an invalid move" do
      game.play(15)
      expect(game.current_player).to eql('X')
    end

    it 'sets finished to true after winning move' do
      game.play(1)
      game.play(5)
      game.play(3)
      game.play(7)
      game.play(2)

      expect(game.finished).to be true
    end

    it 'sets finished to true after a draw' do
      game.play(1)
      game.play(5)
      game.play(8)
      game.play(7)
      game.play(3)
      game.play(2)
      game.play(9)
      game.play(6)
      game.play(4)

      expect(game.finished).to be true
    end

    it "doesn't update finsihed after valid, non winning, or draw move" do
      game.play(8)
      expect(game.finished).to be false
    end
  end

  describe '#to_s' do
    it 'returns an empty board' do
      expect(game.to_s).to eql("-|-|-\n-|-|-\n-|-|-\n")
    end

    it 'returns properly positioned signs on the board' do
      game.play(1)
      game.play(4)
      game.play(9)
      expect(game.to_s).to eql("X|-|-\nO|-|-\n-|-|X\n")
    end
  end
end
