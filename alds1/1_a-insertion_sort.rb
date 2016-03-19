n = STDIN.gets.chomp
a = STDIN.gets.chomp.split(' ').map {|num| num.to_i}


def insertion_sort a, n
  puts a.join ' '
  i = 1
  while i <= (n - 1) do
    v = a[i]
    j = i - 1
    while (j >= 0) and (a[j] > v) do
      a[j + 1] = a[j]
      j -= 1
    end
    a[j + 1] = v
    puts a.join ' '
    i += 1
  end
end
 
insertion_sort a, n.to_i
