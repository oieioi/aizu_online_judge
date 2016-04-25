def linear_search array, key
  array.each_with_index{|val, index|
    return index if val == key
  }
  nil
end

def main array, keys
  puts keys.select{|key|
    linear_search array, key
  }.size

end

size, array, size_2, keys = STDIN.read.split(/\n/)
array = array.split(' ')
keys = keys.split(' ')

main(array, keys)
