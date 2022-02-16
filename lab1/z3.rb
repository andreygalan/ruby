def get_min_element array
    min=array[0]
    for i in array
        min=i   if i < min 
    end
min 
end




puts get_min_element([7,2,3,4,5,6,7])