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
    puts arr
    arr
end


read_from_txt("departments.txt")