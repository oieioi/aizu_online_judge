def cal raw
  ar = raw.clone

  min_value = ar.shift
  max_value = -(10**9)

  ar.each_with_index { |n, i|
    max_value = [max_value, n - min_value].max
    min_value = [n, min_value].min
  }

  max_value

end

size = STDIN.gets.chomp.to_i
prefits = []
size.times{ 
  prefits.push STDIN.gets.chomp.to_i
}


puts cal prefits
