def merge_sort(array)
    return array if array.size == 1 
    if array.size > 1
          a, b = array.each_slice((array.size/2.0).round).to_a
         a_sort = merge_sort(a)
         b_sort = merge_sort(b)
        merge(a_sort, b_sort)
    end
    
  end
# Takes an unsorted array of numbers, divides it in half, and keeps dividing it in half, until each array is one element.


# Merges and sorts these arrays, one by one, until the original full-length array is sorted.

def merge(a, b)
    answer = []
    until a.empty? || b.empty?
      if a[0] <= b[0]
        answer << a[0]
        a.shift
      else
        answer << b[0]
        b.shift
      end
    end
    if a.empty?
        b.each do |item|
           answer << item 
        end
    end
    if b.empty?
       a.each do |item|
           answer << item
       end
    end
    answer
end