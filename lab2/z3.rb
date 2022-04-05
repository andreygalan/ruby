require_relative 'z1.rb'
class Department_list
    def initialize(arr=Array.new)
    @dep_list=arr
    @selected_note=nil
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
end
