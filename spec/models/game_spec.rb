describe Game do

  before do
    @game = Game.new
  end

  describe '#play' do
    it 'swaps the current player' do
      @game.current_player.should.equal 'X'
      @game.play(0,1)
      @game.current_player.should.equal 'O'
      @game.play(0,2)
      @game.current_player.should.equal 'X'
    end

    it 'claims the appropriate board space for the current player' do
      @game.play(0,1)
      @game.board[0,1].should.equal 'X'
    end
  end

  describe '#over?' do
    context 'when there is a winner' do
      before do
        @game.board[0,0] = 'X'
        @game.board[0,1] = 'X'
        @game.board[0,2] = 'X'
      end

      it 'is true' do
        @game.over?.should.be.true
      end
    end

    context 'when the board is full' do
      before do
        # Ugh, so clunky!
        # X X O
        # O O X
        # X O X
        @game.board[0,0] = 'X'
        @game.board[0,1] = 'X'
        @game.board[0,2] = 'O'
        @game.board[1,0] = 'O'
        @game.board[1,1] = 'O'
        @game.board[1,2] = 'X'
        @game.board[2,0] = 'X'
        @game.board[2,1] = 'O'
        @game.board[2,2] = 'X'
      end

      it 'is true' do
        @game.over?.should.be.true
      end
    end

    context 'when the game is not over yet' do
      it 'is true' do
        @game.over?.should.be.false
      end
    end
  end

  describe '#winner' do
    context 'when X has won' do
      before do
        @game.board[0,0] = 'X'
        @game.board[1,1] = 'X'
        @game.board[2,2] = 'X'
      end

      it 'returns X' do
        @game.winner.should.equal 'X'
      end
    end

    context 'when O has won' do
      before do
        @game.board[1,0] = 'O'
        @game.board[1,1] = 'O'
        @game.board[1,2] = 'O'
      end

      it 'returns O' do
        @game.winner.should.equal 'O'
      end
    end

    context 'when nobody has won' do
      it 'is nil' do
        @game.winner.should.be.nil
      end
    end
  end
end
