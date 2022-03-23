def read_arrayf(path)
    input = File.open(path)
    input.readlines.map {|line| line.strip}    
end

def sort_method1(lines)
    lines.sort_by {|line| line.chars.inject(0){|ascii_sum, char| ascii_sum += char.ord}/line.chars.size }
end

def sort_method2(lines)
    avr_ascii = lines[0].chars.inject(0){|ascii_sum, char| ascii_sum +=char.ord}/lines[0].chars.size
    lines.sort_by {|line| (line.chars.inject(0){|ascii_sum, char| ascii_sum += char.ord}/line.chars.size - avr_ascii)**2 }
end

lines = read_arrayf('stringFILE.txt')

puts sort_method2(lines)