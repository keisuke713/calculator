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
      expect(Calculator::Runner.run).to eq '2と1を足した数字は3です'
    end
  end
end
