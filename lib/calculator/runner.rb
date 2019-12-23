module Calculator
  class Runner
    def self.run
      new.run
    end
    def run
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
        how_calc = STDIN.gets.chomp
        case how_calc
        when '1'
          return Calculator::Output.run(num1.to_i + num2.to_i)
        when '2'
          return Calculator::Output.run(num1.to_i - num2.to_i)
        when '3'
          return Calculator::Output.run(num1.to_i * num2.to_i)
        when '4'
          begin
            return Calculator::Output.run(num1.to_i / num2.to_i)
          rescue ZeroDivisionError => error
            return "0で割ることはできません"
          end
        else
          return '1から4の数字の中から選択してください'
        end
      end
    end
  end
end
