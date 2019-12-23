module Calculator
  class Calculate
    def self.do(num1, num2, how_to_calculate)
      case how_to_calculate
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
          return '0で割ることはできません'
        end
      else
        reutrn '1から4の数字の中から選択してください'
      end
    end
  end
end
