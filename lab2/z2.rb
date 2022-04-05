require_relative 'z1.rb'
require_relative 'z3.rb'

require "yaml"

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

def write_to_yaml(path, arr)
    File.open(path, "w") do |file|
        file.write(YAML.dump(arr))
    end
end

def read_from_yaml(path)
    Psych.safe_load_file(path, permitted_classes: [Department])
end


#arr=read_from_txt("departments.txt")
#arr=read_from_yaml("departments.yaml")
#print_dep(arr)
#arr.append(Department.new("закупок","89284355055"))
#print_dep(arr)
#write_to_yaml("departments.yaml",arr)
d_list=Department_list.new("departments.txt")
puts d_list 
d_list.add_note(Department.new("закупок","89284355055"))
puts d_list 
d_list.write_to_yaml("departments.yaml")