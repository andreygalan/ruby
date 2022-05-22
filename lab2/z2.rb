require_relative 'Department.rb'
require_relative 'Department_list.rb'

require "yaml"

def read_from_txt(path)
    arr = Array.new
    file = File.new(path, "r:UTF-8")
    text = file.read
    arr = text.split((/\n_+\n/)).map do|dep|
        Department.get_dep_str(dep)
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

d_list=Department_list.read_from_yaml("departments2.yaml")
#d_list.add_note(dep)

arr = d_list.get_note.get_vacancies
arr[0]= 1
puts d_list.get_note.get_vacancies

#puts d_list.to_s_short
#print_dep(arr)
#print_dep(arr)
#write_to_yaml("departments.yaml",arr)
#d_list=Department_list.read_from_yaml("departments.yaml")
#puts d_list 
#d_list.add_note(Department.new("закупок","89284355055"))
#d_list.sort_by_name
#puts d_list 
#d_list.write_to_yaml("departments2.yaml")