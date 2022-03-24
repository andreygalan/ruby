
def read_arrayf(path)
    input = File.open(path)
    input.readlines.map {|line| line.strip}    
end

#2 В порядке увеличения среднего веса ASCII-кода символа строки
def sort_method1(lines)
    lines.sort_by {|line| find_avg_weigh_of_ASCII_code(line) }
end

#4 В порядке увеличения квадратичного отклонения среднего веса ASCII-
#кода символа строки от среднего веса ASCII-кода символа первой строки
def sort_method2(lines)
    avr_ascii = find_avg_weigh_of_ASCII_code(lines[0])
    lines.sort_by {|line| standart_deviation(find_avg_weigh_of_ASCII_code(line) - avr_ascii) }
end

#7 В порядке увеличения разницы между количеством сочетаний
#«гласная-согласная» и «согласная-гласная» в строке
def sort_method3(lines)
    lines.sort_by {|line| (line.scan(/[aouie][^aouie .,!?:;]/).size - line.scan(/[^aouie .,!?:;][aouie]/).size).abs}
end


#11 В порядке квадратичного отклонения дисперсии максимального
#среднего веса ASCII-кода тройки символов в строке от максимального
#среднего веса ASCII-кода тройки символов в первой строке
def dispersion(values)
	expected_value(values.map {|value| value**2}) - expected_value(values)**2
end

def expected_value(values)
	p = Hash.new
	uniqValues = values.uniq
	uniqValues.each {|value| p[value] = values.count(value) / values.length.to_f}
	uniqValues.map {|value| value * p[value]}.sum
end

def avg_max_weighs_of_triplets_ASCII_code(line)
	line.scan(/.../).map {|triplet| find_avg_weigh_of_ASCII_code(triplet)}
end

def find_avg_weigh_of_ASCII_code(line)
	line.chars.inject(0){|ascii_sum, char| ascii_sum += char.ord}/line.chars.size
end

def standart_deviation(val1, val2)
	Math.sqrt((val1 - val2)**2) 
end

def sort_method4(lines)
    lines.sort_by {|line| standart_deviation( dispersion(avg_max_weighs_of_triplets_ASCII_code(line)) , avg_max_weighs_of_triplets_ASCII_code(lines[0]).max  )}
end

lines = read_arrayf('stringFILE.txt')

puts sort_method4(lines)