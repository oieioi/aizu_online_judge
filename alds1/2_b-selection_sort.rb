def selection_sort! size, target_array
  count = 0
  size.times {|i|
    unsorted = target_array[i..(size - 1)]
    min = unsorted.min
    index_min = unsorted.index(min)
    if min < target_array[i]
      target_array[i], target_array[i + index_min] = target_array[i + index_min], target_array[i]
      count += 1
    end
  }
  count
end


size = STDIN.gets.chomp.to_i
target_array = STDIN.gets.chomp.split(' ').map{|n|n.to_i}

count = selection_sort!(size, target_array)
puts target_array.join ' '
puts count

