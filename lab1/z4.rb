def method1 array
    array.inject(0){|min_index,i| i< array[min_index] ? i : min_index}
end
def method1_v2 array
    _, idx = array.each_with_index.min
    idx
end

puts method1_v2 [8,3,4,5,1,6,7]