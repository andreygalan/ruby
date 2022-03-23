def read_arrayf(path)
    input = File.open(path)
    input.readlines.map {|line| line.strip}      
end

puts read_arrayf('stringFILE.txt').sort_by {|line| line.size}