# 最大公約数を求める
def cal_gcd x, y
  # swap
  x, y = y, x if x < y

  while (y > 0)
    r = x % y
    x = y
    y = r
  end

  x

end

x, y = STDIN.gets.chomp.split(' ').map {|n| n.to_i}

puts cal_gcd x, y
