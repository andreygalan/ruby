require_relative 'z1.rb'
class Department_list
    def initialize(path)
        @dep_list=Array.new()
        @selected_note=nil
        extension = path.split(".")[-1]
        case extension
            when "txt"
            @dep_list=self.read_from_txt(path)
            when "yaml"
            @dep_list=self.read_from_yaml(path)
        end
    end

    def add_note(department)
        @dep_list.append(department)
    end

    def choose_note(dep_name)
        _,@selected_note= @dep_list.each_with_index.find{|dep,index| dep.name==dep_name}
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
    
    def read_from_yaml(path) 
        Psych.safe_load_file(path, permitted_classes: [Department])
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
