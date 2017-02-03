def bubble_sort(array)
  swap_counter = -1

  array.each_with_index do |index, x|
    array.each_with_index do |index, y|
      swap_counter == 0
      if array[y] > array[x]
        array[x], array[y] = array[y], array[x]
        swap_counter += 1
      else
        swap_counter += 1
      end
      break if swap_counter == 0
    end
  end
end

def bubble_sort_by(array)
        swap_counter = -1

  array.each_with_index do |index, x|
    array.each_with_index do |index, y|
      swap_counter == 0
      if (yield array[x], array[y]) > 0
         array[x], array[y] = array[y], array[x]
         swap_counter += 1
      else
        swap_counter += 1
      end
      break if swap_counter == 0
    end
  end
end

bubble_sort_by(["hi","hey","hello"]) do |left,right|
       left.length - right.length
  end
bubble_sort_by(["a", "b", "c"]) { |a, b| a <=> b }
