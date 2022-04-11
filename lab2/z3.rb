require_relative 'z1.rb'
class Department_list
    def initialize(arr=Array.new())
        @dep_list=arr
        @selected_note=nil
    end

    def add_note(department)
        @dep_list.append(department)
    end

    def choose_note(index)
        @selected_note=index
    end

    def change_note(department)
        @dep_list[@selected_note]=department
    end
    
    def get_note()
        @dep_list[@selected_note]
    end

    def delete_note()
        @dep_list.delete_at(@selected_note)
    end

    def Department_list.read_from_txt(path)
        file = File.new(path, "r:UTF-8")
        text = file.read
        arr = text.split((/\n_+\n/)).map do|dep|
            Department.get_dep_str(dep)
        end
        Department_list.new(arr)
    end
    
    def write_to_txt(path)
        File.open("#{path}", "w") do |file|
            @dep_list.each do |e|
                file.puts e
                file.puts "_"
            end
        end
    end

    def write_to_yaml(path)
        File.open(path, "w") do |file|
            file.write(YAML.dump(@dep_list))
        end
    end
    
    def Department_list.read_from_yaml(path) 
        Department_list.new(Psych.safe_load_file(path, permitted_classes: [Department]))
    end

    def sort_by_name()
        @dep_list.sort_by!{|dep| dep.name.downcase}
    end

    def to_s()
        str=""
        @dep_list.each do |dep|
            str+=dep.to_s() +"\n"+"_\n"
        end
        str
    end
end
