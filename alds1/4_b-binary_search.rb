def binary_search array, key
  #puts "#{key} in #{array.join ','}?"
  pivot = array.size / 2
  targets = array.dup
  loop do
    # 真ん中あたりを調べる
    #sleep 0.1
    #puts "#{targets.join(',')} の #{pivot}番目は #{targets[pivot]}"
    if targets.size == 1 && targets[0] != key
      return nil
    elsif targets[pivot].nil?
      return nil
    elsif targets[pivot] == key
      # bingo
      # TODO: ほんとはindexを返さす
      return true
    elsif targets[pivot] > key
      #pivotより左を調べる
      targets = targets[0..(pivot - 1)]
      pivot = targets.size / 2
    elsif targets[pivot] < key
      targets = targets[(pivot + 1)..targets.size]
      pivot = targets.size / 2
    else
      return nil
    end
  end
end

def main size, array, keys_size, keys
  puts keys.select{|key|
    binary_search array, key
  }.size

end

size, array, keys_size, keys = STDIN.read.split(/\n/)
array = array.split(' ').map{|n|n.to_i}
keys = keys.split(' ').map{|n|n.to_i}

main(size, array, keys_size, keys)
