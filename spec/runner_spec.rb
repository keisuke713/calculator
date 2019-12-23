RSpec.describe Calculator::Runner do
  shared_examples 'return 数字以外の物が入力されています' do
    it { expect(Calculator::Runner.run).to eq '数字以外の物が入力されています。やり直してください' }
  end

  context 'num1 is wrong' do
    before do
      allow(STDIN).to receive(:gets).and_return('a', '1')
    end
    it_behaves_like 'return 数字以外の物が入力されています'
  end
  context 'num2 is wrong' do
    before do
      allow(STDIN).to receive(:gets).and_return('1', 'a')
    end
    it_behaves_like 'return 数字以外の物が入力されています'
  end
  context 'num1 and num2 are wrong' do
    before do
      allow(STDIN).to receive(:gets).and_return('a', 'a')
    end
    it_behaves_like 'return 数字以外の物が入力されています'
  end
  context 'num1 and num2 is correct' do
    before do
      allow(STDIN).to receive(:gets).and_return('2', '1')
    end
    it 'return add nums' do
      expect(Calculator::Runner.run).to eq "計算結果は3です" 
    end
  end
  context 'select addition' do
    before do
      allow(STDIN).to receive(:gets).and_return('2', '1', '1')
    end
    it 'return 3' do
      expect(Calculator::Runner.run).to eq "計算結果は3です"
    end
  end
  context 'select subtraction' do
    before do
      allow(STDIN).to receive(:gets).and_return('2', '1', '2')
    end
    it 'return 1' do
      expect(Calculator::Runner.run).to eq "計算結果は1です"
    end
  end
  context 'select multiplication' do
    before do
      allow(STDIN).to receive(:gets).and_return('2', '3', '3')
    end
    it 'return 6' do
      expect(Calculator::Runner.run).to eq "計算結果は6です"
    end
  end
  context 'select division' do
    before do
      allow(STDIN).to receive(:gets).and_return('8', '2', '4')
    end
    it 'return 4' do
      expect(Calculator::Runner.run).to eq "計算結果は4です"
    end
  end
  context 'select division when input 0' do
    before do
      allow(STDIN).to receive(:gets).and_return('1', '0', '4')
    end
    it 'return error message' do
      expect(Calculator::Runner.run).to eq "0で割ることはできません"
    end
  end
end
