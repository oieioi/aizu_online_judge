# sumをつくれるか
module Main
  extend self

  @@memo = {}
  def can_assemble?(elements, index, sum, raw_elements_length)
    unless @@memo[index].nil?
      return @@memo[index][sum] unless @@memo[index][sum].nil?
    else
      @@memo[index] = {}
    end

    if sum == 0
      true
    elsif index >= raw_elements_length
      false
    else
      @@memo[index][sum] = can_assemble?(elements, index + 1, sum, raw_elements_length) || can_assemble?(elements, index + 1, sum - elements[index], raw_elements_length)
      @@memo[index][sum]
    end
  end

  def main
    lines = STDIN.read.split(/\n/)
    lines.shift

    elements = lines.shift.split(' ').map{|s|s.to_i}
    lines.shift

    sums = lines.shift.split(' ').map{|s|s.to_i}
    sums.each{ |sum|
      puts can_assemble?(elements, 0, sum, elements.size) ? 'yes' : 'no'
    }

  end
end

Main::main
