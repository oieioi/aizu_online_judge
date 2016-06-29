# sumをつくれるか
def can_assemble?(elements, sum)
  elements.size.times.each_with_index { |size|
    elements.combination(size){ |nums|
      return true if (nums.reduce{|n,s| n + s }) == sum
    }
  }

  false
end

def main
  lines = STDIN.read.split(/\n/)
  lines.shift

  elements = lines.shift.split(' ').map{|s|s.to_i}
  lines.shift

  sums = lines.shift.split(' ').map{|s|s.to_i}
  sums.each{ |sum|
    puts can_assemble?(elements, sum) ? 'yes' : 'no'
  }

end

main
