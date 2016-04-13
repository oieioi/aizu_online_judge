$cnt = 0

def calc arr
  operators = %w(+ - *)
  stack = []
  arr.each { |item|
    # 演算子だったらスタックから2つ取り出して計算し、結果をスタックに入れなおす
    if operators.include? item
      first = stack.pop
      second = stack.pop
      stack.push eval "#{second} #{item} #{first}"
    elsif
      # 数字だったらスタックに詰む
      stack.push item
    end
  }

  stack
end

inputs = STDIN.gets.chomp.split(' ')

p calc(inputs).first
