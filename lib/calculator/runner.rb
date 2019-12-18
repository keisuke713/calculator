module Calculator
  class Runner
    def self.run
      loop do
        print '一つ目の数字を入力してください:'
        num1 = gets.chomp      
        print '二つ目の数字を入力してください:'
        num2 = gets.chomp
        if (num1.class != Integer) || (num2.class != Integer)
          puts '数字以外の物が入力されています。やり直してください'
          next
        end
        sum_num = num1 + num2
        puts "#{num1}と#{num2}を足した数字は#{sum_num}です"
        break
      end
    end
  end
end
