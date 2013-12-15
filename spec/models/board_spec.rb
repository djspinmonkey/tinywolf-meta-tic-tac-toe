describe Board do

  before do
    @board = Board.new
  end

  describe '#[]' do
    context 'for a position owned by X' do
      it 'returns "X"' do
        @board[1,1] = 'X'
        @board[1,1].should.equal 'X'
      end
    end

    context 'for a position owned by neither player' do
      it 'returns nil' do
        @board[1,1].should.equal nil
      end
    end

    context 'passed invalid coordinates' do
      it 'raises an exception' do
        lambda { @board[1,8] = 'X' }.
          should.raise(RuntimeError).
          message.should.match(/Invalid coordinates/i) 
      end
    end
  end

  describe '#[]=' do
    it 'sets the owner of that position' do
      @board[1,1].should.equal(nil)
      @board[1,1] = 'X'
      @board[1,1].should.equal('X')
    end

    context 'for a positioned already owned' do
      before { @board[1,1] = 'X' }

      it 'raises an exception' do
        lambda { @board[1,1] = 'X' }.
          should.raise(RuntimeError).
          message.should.match(/already owned/i)  
      end
    end

    context 'passed an invalid value' do
      it 'raises an exception' do
        lambda { @board[1,1] = 'bogus' }.
          should.raise(RuntimeError).
          message.should.match(/invalid player/i) 
      end
    end

    context 'passed invalid coordinates' do
      it 'raises an exception' do
        lambda { @board[1,8] = 'X' }.
          should.raise(RuntimeError).
          message.should.match(/invalid coordinates/i)
      end
    end
  end

  describe '#full?' do
  end

  describe '#three_in_a_row?' do
    context 'when there are three in a row' do
      before do
        @board[0,1] = 'X'
        @board[1,1] = 'X'
        @board[2,1] = 'X'
      end

      it 'should return the player with three in a row' do
        @board.three_in_a_row?.should.equal 'X'
      end
    end

    context 'when there are not' do
      before do
        @board[0,1] = 'X'
        @board[1,1] = 'O'
        @board[2,1] = 'X'
      end

      it 'is false' do
        @board.three_in_a_row?.should.be.falsey
      end
    end
  end
end
