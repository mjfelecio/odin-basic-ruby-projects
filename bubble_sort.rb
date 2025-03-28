def bubble_sort(num_array)
  while num_array != num_array.sort
    num_array.each_index do |idx|
      break if idx == num_array.length - 1
      next if num_array[idx] < num_array[idx + 1]

      num_array[idx], num_array[idx + 1] = num_array[idx + 1], num_array[idx]
    end
  end
  num_array
end

test_array = Array.new(10) { rand(100) }
p test_array
p bubble_sort(test_array)
