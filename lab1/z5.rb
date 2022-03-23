def method1 str 
    a=str.split("") - ("A".."Z").to_a
    a==a.sort
end

def method2 str 
    str.scan(/[A]/).size
end

def method3 str 
    str.scan(/([^\/\\$:*<>|]+)(?=\.\w+$)/).size
end

