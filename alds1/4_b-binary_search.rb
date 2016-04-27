def binary_search array, key, pivot, head_index
  targets = array.dup
  #puts "#{key} in [#{targets.join(',')}][#{pivot}] is #{targets[pivot]}"
  if (targets.size == 1) && (targets[0] != key)
    return nil
  elsif targets.size == 0
    return nil
  elsif targets[pivot] == key
    return pivot + head_index
  elsif targets[pivot] > key
    #pivotより左を調べる
    next_target = targets[0..(pivot - 1)]
    binary_search(next_target, key, next_target.size / 2, 0)
  elsif targets[pivot] < key
    #pivotより右を調べる
    next_target = targets[(pivot + 1)..targets.size]
    binary_search(next_target, key, next_target.size / 2, pivot)
  else
    raise "おかしいで #{array.join(',')}, #{key} #{pivot} #{head_index}"
  end
end

def main size, array, keys_size, keys
  puts keys.select{|key|
    not binary_search(array, key, array.size / 2, 0).nil?
  }.size

end

size, array, keys_size, keys = STDIN.read.split(/\n/)
array = array.split(' ').map{|n|n.to_i}
keys = keys.split(' ').map{|n|n.to_i}

main(size, array, keys_size, keys)
