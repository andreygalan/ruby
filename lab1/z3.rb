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

def get_mult_element array
    mult=1
    for i in array
        mult *= i   
    end
    mult 
end

def read_arrayk()

    input = STDIN.gets.chomp.strip
    arr = Array.new

    while input != ""
        arr << input.to_i
        input = STDIN.gets.chomp.strip
    end

    arr
end

def read_arrayf(path)

    input = File.open(path){ |file| file.read }
    input.split.each{|i| i.to_i}   
end


if ARGV[1].length==0
    puts "Введите второй аргумент"
else


    case ARGV[1]
        when '-f'
        if ARGV[2].length==0
            puts "Пути нет. Вводи с клавиатуры"
            arr=read_arrayk()
        else
            arr=read_arrayf ARGV[2]
        end
        when '-k'
        arr=read_arrayk()
    end



    case ARGV[0]

        when '1'
            puts get_min_element arr
        when '2'
            puts get_max_element arr

        when '3'
            puts get_sum_element arr
        when '4'
            puts get_mult_element arr
        else
            puts 'Hello World'
    end

end
