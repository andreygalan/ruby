def get_min_element array
    min=array[0]
    for i in array
        min=i   if i < min 
    end
min 
end

def get_max_element array
    max=array[0]
    for i in array
        max=i   if i > max 
    end
    max 
end

def get_sum_element array
    sum=0
    for i in array
        sum += i   
    end
    sum 
end

