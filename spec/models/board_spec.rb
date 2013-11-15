require 'spec_helper.rb'

describe Board do
  let(:board) { Board.new }

  describe '#[]' do
    subject { board[1,1] }

    context 'for a position owned by X' do
      before { board[1,1] = 'X' }
      it { should eq 'X' }
    end

    context 'for a position owned by neither player' do
      it { should be_nil }
    end

    context 'passed invalid coordinates' do
      it 'raises an exception' do
        expect { board[1,8] = 'X' }.to raise_error /invalid coordinates/i
      end
    end
  end

  describe '#[]=' do
    it 'sets the owner of that position' do
      expect { board[1,1] = 'X' }.to change { board[1,1] }.from(nil).to('X')
    end

    context 'for a positioned already owned' do
      before { board[1,1] = 'X' }

      it 'raises an exception' do
        expect { board[1,1] = 'X' }.to raise_error /already owned/
      end
    end

    context 'passed an invalid value' do
      it 'raises an exception' do
        expect { board[1,1] = 'bogus' }.to raise_error /invalid player/i
      end
    end

    context 'passed invalid coordinates' do
      it 'raises an exception' do
        expect { board[1,8] = 'X' }.to raise_error /invalid coordinates/i
      end
    end
  end

  describe '#full?' do
  end

  describe '#three_in_a_row?' do
    subject { board.three_in_a_row? }

    context 'when there are three in a row' do
      before do
        board[0,1] = 'X'
        board[1,1] = 'X'
        board[2,1] = 'X'
      end

      it 'should return the player with three in a row' do
        board.three_in_a_row?.should eq 'X'
      end
    end

    context 'when there are not' do
      before do
        board[0,1] = 'X'
        board[1,1] = 'Y'
        board[2,1] = 'X'
      end

      it { should be_false }
    end
  end
end
