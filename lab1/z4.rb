def method1 array
    array.inject(0){|min_index,i| i< array[min_index] ? i : min_index}
end

def method1_v2 array
    _, idx = array.each_with_index.min
    idx
end

def method2 a,b
    b-a+1
end

def method2_v2 array,a,b
    array[a..b].size
end
puts method2 1,5