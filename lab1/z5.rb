def method1 str 
    a=str.split("") - ("A".."Z").to_a
    a==a.sort
end

def method2 str 
    str.scan(/[A]/).size
end

def method3 str 
    str.scan(/(?<=\\)([^\/\\$:*<>|]+)(?=\.\w+$)/)
end

def method4 str 
    regex = /(?<=\D|^)(?:(?:(?:0?[1-9]|[12][0-9]|3[01]) (?:января|марта|мая|июля|августа|октября|декабря))|(?:(?:0?[1-9]|[12][0-9]|30) (?:апреля|июня|сентября|ноября))|(?:(?:0?[1-9]|[1][0-9]|2[0-9]) февраля)) (?:[0-9]{1,4})/
    str.scan(regex)
end

def method5 str 
    
    str.scan(/[a-z]/)
end

puts method5 "asdgwSADWdrdsfASD"
