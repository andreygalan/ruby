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
dep=Department.new("транспорта","89182633044")
dep.add_post("уборшик","12",true)
dep.add_post("ст.уборшик","13",false)
dep.add_post("мл.уборшик","11",false)
puts dep.get_all_posts
dep.select_post(1)
puts
puts dep.get_selected_post
puts
dep.delete_post
puts dep.get_all_posts
dep.change_post("клинер","12",true)
puts
puts dep.get_all_posts
puts
puts dep.get_vacancies

#print_dep(arr)
#print_dep(arr)
#write_to_yaml("departments.yaml",arr)
#d_list=Department_list.read_from_yaml("departments.yaml")
#puts d_list 
#d_list.add_note(Department.new("закупок","89284355055"))
#d_list.sort_by_name
#puts d_list 
#d_list.write_to_yaml("departments.yaml")