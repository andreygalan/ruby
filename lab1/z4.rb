
# №2 Дан целочисленный массив. Необходимо найти индекс
# минимального элемента.

def method1 array
    array.each_with_index.inject(0){|min_index, (v,i)| v< array[min_index] ? i : min_index}
end


def method1_v2 array
    _, idx = array.each_with_index.min
    idx
end
# №14 Дан целочисленный массив и интервал a..b. Необходимо найти
# количество элементов в этом интервале.

def method2 array,a,b
    array[a..b].size
    
end

def method2_v2 a,b
    b-a+1
end
# №26 Дан целочисленный массив. Необходимо найти количество
# элементов между первым и последним минимальным.
def method3 array
    a = method1 array
    b = (method1 array.reverse)+1
    array[a+1...-b]
end

#38 Дан целочисленный массив и отрезок a..b. Необходимо найти
#количество элементов, значение которых принадлежит этому отрезку.
def method4 array,a,b
    array.inject(0){|count,v| (v>=a and v<=b) ? count+1 : count}
end

#50 Для двух введенных списков L1 и L2 построить новый список,
#состоящий из элементов, встречающихся только в одном из этих списков и
#не повторяющихся в них.
def method5 l1,l2
    (l1-l2)+(l2-l1)
end

array=[8,3,4,5,1,6,7]
puts method5 [8,1,4,1,6,6,5,4,9,7],[1,4,6,9,10,13]
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
            puts method1 arr
        when '2'
            puts "Введите a: "
            a = STDIN.gets.chomp.strip
            puts "Введите b: "
            b = STDIN.gets.chomp.strip
            puts method2  arr,a,b

        when '3'
            puts method3 arr
        when '4'
            puts "Введите a: "
            a = STDIN.gets.chomp.strip
            puts "Введите b: "
            b = STDIN.gets.chomp.strip
            puts method4 arr,a,b
        when '5'
            puts "Введите второй массив: "
            arr2=read_arrayk()
            puts method5 arr,arr2
        else
            puts 'Hello World'
    end

end
