def selection_sort size, raw_array
  target_array = raw_array.dup
  size.times {|i|
    unsorted = target_array[i..(size - 1)]
    min = unsorted.min{|a, b| a[/\d+/] <=> b[/\d+/]}
    index_min = unsorted.index(min)
    if min[/\d+/] < target_array[i][/\d+/]
      target_array[i], target_array[i + index_min] = target_array[i + index_min], target_array[i]
    end
  }
  target_array
end

def bubble_sort size, raw_array
  target_array = raw_array.dup
  swapped = true
  while swapped do
    swapped = false
    (size - 1).downto(1) do |i|
      if target_array[i][/\d+/] < target_array[i - 1][/\d+/]
        target_array[i], target_array[i - 1] = target_array[i - 1], target_array[i]
        swapped = true
      end
    end
  end
  target_array
end

def stable? unsorted_array, sorted_array
  unsorted_array = unsorted_array.dup
  sorted_array = sorted_array.dup
  until unsorted_array.size == 0
    # 同じ数字を持つものを抜き出す
    target_num = card_to_s(unsorted_array[0])
    unsorted_target = unsorted_array.select {|i| card_to_s(i) == target_num }
    sorted_target = sorted_array.select     {|i| card_to_s(i) == target_num }
    # 順番が違ったら安定じゃない
    return 'Not stable' unless unsorted_target == sorted_target
    # 調べたカードは削除する
    unsorted_array = unsorted_array - unsorted_target
  end
  return 'Stable'

end

def card_to_s card
  card[/\d+/].to_i
end

size = STDIN.gets.chomp.to_i
raw_array = STDIN.gets.chomp.split(' ')

bubbled_array = bubble_sort size, raw_array
selected_array = selection_sort size, raw_array

puts bubbled_array.join ' '
puts stable? raw_array, bubbled_array
puts selected_array.join ' '
puts stable? raw_array, selected_array
