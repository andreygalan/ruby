def read_arrayf(path)
    input = File.open(path)
    input.readlines.map {|line| line.strip}    
end

def sort_method1(lines)
    lines.sort_by {|line| line.chars.inject(0){|ascii_sum, char| ascii_sum +=char.ord}/line.chars.size }
end

lines = read_arrayf('stringFILE.txt')

puts sort_method1(lines)