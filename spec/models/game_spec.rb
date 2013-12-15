describe Game do

  before do
    @game = Game.new
  end

  describe '#current_player' do
  end

  describe '#play' do
  end

  describe '#over?' do
  end

  describe '#winner' do
    subject { @game.winner }

    context 'when X has won' do
      before do
        @game.board[0,0] = 'X'
        @game.board[1,1] = 'X'
        @game.board[2,2] = 'X'
      end

      it { should eq 'X' }
    end

    context 'when Y has won' do
      before do
        @game.board[1,0] = 'Y'
        @game.board[1,1] = 'Y'
        @game.board[1,2] = 'Y'
      end

      it { should eq 'Y' }
    end

    context 'when nobody has won' do
      it { should be_nil }
    end
  end
end
