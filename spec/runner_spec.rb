RSpec.describe Calculator::Runner do
  shared_examples 'return 数字以外の物が入力されています' do
    it { expect(1 + 2).to eq 3 }
  end

  context 'num1 is wrong' do
    it_behaves_like 'return 数字以外の物が入力されています'
  end
  context 'num2 is wrong' do
    it_behaves_like 'return 数字以外の物が入力されています'
  end
  context 'num1 and num2 are wrong' do
    it_behaves_like 'return 数字以外の物が入力されています'
  end
  context 'num1 and num2 is correct' do
    it 'return add nums' do
      expect(1 + 2).to eq 3
    end
  end
end
