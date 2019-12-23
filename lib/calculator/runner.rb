module Calculator
  class Runner
    def self.run
      loop do
        print '一つ目の数字を入力してください:'
        num1 = STDIN.gets.chomp      
        print '二つ目の数字を入力してください:'
        num2 = STDIN.gets.chomp
        if (num1 =~ /\D/) || (num2 =~ /\D/)
          return '数字以外の物が入力されています。やり直してください'
          next
        end

        print '計算方法はどうしますか: 1.+, 2.-, 3.*, 4./ '
        how_to_calculate = STDIN.gets.chomp
        break Calculator::Calculate.do(num1, num2, how_to_calculate)
      end
    end
  end
end
