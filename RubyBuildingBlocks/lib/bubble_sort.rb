def bubble_sort(array)
  flag = true

  array.each_with_index do |out_index, x|
    array.each_with_index do |in_index, y|
      if array[y] > array[x]
        array[x], array[y] = array[y], array[x]
        flag = false
      end
      break if flag = true
    end
  end
    p flag
    p array
end

def bubble_sort_by(array)
        flag = true

  array.each_with_index do |index, x|
    array.each_with_index do |index, y|
      if (yield array[x], array[y]) > 0
         array[x], array[y] = array[y], array[x]
         flag = false
      end
      break if flag = false
    end
  end
    p flag
    p array
end

bubble_sort_by(["hi","hey","hello"]) do |left,right|
       left.length - right.length
  end
bubble_sort_by(["a", "b", "c"]) { |a, b| a <=> b }









