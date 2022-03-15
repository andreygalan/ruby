def method1 str 
    a=str.split("") - ("A".."Z").to_a
    a==a.sort
end


puts method1 "abAcdAA"