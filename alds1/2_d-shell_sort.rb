$cnt = 0

def insertion_sort arr, size, distance
  # 間隔gだけを抜き出して挿入ソートする
  # gは適当に決め、狭めていく
  # 8 3 1 2 7 5 6 4
  # g = 4
  (distance..(size - 1)).each do |i|
    value = arr[i]
    last_target_index = i - distance
    while last_target_index >= 0 and arr[last_target_index] > value
      arr[last_target_index + distance] = arr[last_target_index]
      last_target_index = last_target_index - distance
      $cnt+=1
    end
    arr[last_target_index + distance] = value
  end
  arr
end

def shell_sort a, n
  g = get_m n
  m = g.size
  (0..(m - 1)).each {|i| insertion_sort a, n, g[i]}
  [m, g]
end

def get_m n
  result_array = [1]
  loop do
    next_pushed_value = (3 * result_array.last) + 1
    break if next_pushed_value > n
    result_array.push next_pushed_value
  end
  result_array.reverse
end


size = STDIN.gets.chomp.to_i
target_array = size.times.map{
  STDIN.gets.chomp.to_i
}
m, m_array = shell_sort(target_array, size)

puts m
puts m_array.join ' '
puts $cnt
target_array.each{|v| puts v}

