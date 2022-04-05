require_relative 'z1.rb'

def read_from_txt(path)
    arr = Array.new
    file = File.new(path, "r:UTF-8")
    text = file.read
    arr = text.split((/\n_+\n/)).map do|dep|
        dep = dep.split("\n")
        dep_name,phone_number=dep[0].split("|")
        duties=Hash.new
        dep[1..dep.size].each do|duty| 
            duty,spec = duty.split(":")
            duties[duty]=spec
        end
        Department.new(dep_name,phone_number,duties)
    end
    arr
end

def write_to_txt(path, arr)
    File.open("#{path}", "w") do |file|
        arr.each do |e|
            file.puts e
            file.puts "_"
        end
    end
end

def print_dep(arr)
    arr.each do |dep|
        puts dep
        puts "_"
    end
end


arr=read_from_txt("departments.txt")
print_dep(arr)
write_to_txt("departments_out.txt",arr)