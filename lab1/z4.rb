def method1 array
    array.each_with_index.inject(0){|min_index, (v,i)| v< array[min_index] ? i : min_index}
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

def method3 array
    a = method1 array
    b = (method1 array.reverse)+1
    array[a+1...-b]
end

array=[8,3,4,5,1,6,7]
puts method3 [8,1,4,5,1,6,7]