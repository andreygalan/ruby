require_relative 'Post_list.rb'
require_relative 'Post.rb'

class Department
    attr_accessor :name 
    attr_reader :phone_number

    def initialize(name,phone_number,duties=Hash.new,selected_duty=nil,post_list=Post_list.new)
        self.name= name
        self.phone_number= phone_number
        @duties = duties
        @selected_duty = selected_duty
        @post_list = post_list
    end

    def phone_number=(phone_number)
        if not Department.is_phone_number?(phone_number)
            raise "Некорректный номер телефона"
        end
        phone_number.gsub!(/^8/, "7")
        @phone_number = phone_number.delete("- )(+")
    end

    def to_s()
        department_str="#{@name}|#{@phone_number}"
        @duties.keys.each{|duty| department_str+="\n#{duty}:#{@duties[duty]}"}
        department_str
    end
    
    def Department.get_dep_str(dep)
        dep = dep.split("\n")
        dep_name,phone_number=dep[0].split("|")
        duties=Hash.new
        dep[1..dep.size].each do|duty| 
            duty,spec = duty.split(":")
            duties[duty]=spec
        end
        Department.new(dep_name,phone_number,duties)
    end

    def add_duty(duty,specification)
        @duties[duty] = specification
    end

    def select_duty(duty)
        if @duties.has_key?(duty)
            @select_duty = duty
        else
            raise "Нет обязанности"
        end
    end

    def delete_duty()
        @duties.delete(@select_duty)
        @select_duty = @duties.keys[0]
    end

    def get_specification()
        @duties[@select_duty]
    end

    def change_specification(specification)
        @duties[@select_duty] = specification
    end

    def get_duties()  
        @duties.keys.join(" | ")
    end

    def add_post(post_name,salary,vacancy)
        @post_list.add_note(Post.new(@name,post_name,salary,vacancy))
    end

    def select_post(index)
        @post_list.choose_note(index)
    end

    def get_selected_post()
        @post_list.get_note
    end

    def delete_post()
        @post_list.delete_note
    end

    def change_post(post_name,salary,vacancy)
        @post_list.change_note(Post.new(@name,post_name,salary,vacancy))
    end

    def get_vacancies()
        @post_list.get_vacancies
    end

    def get_all_posts()
        @post_list.post_list
    end

    def self.is_phone_number?(phone_number)
        return phone_number.scan(/^(\s*)?(\+?7|8)([(\- ]?\d{3}[)\- ]?)(\d{3}[\- ]?\d{2}[\- ]?\d{2}|\d{2}[\- ]?\d{3}[\- ]?\d{2})(\s*)?$/).length == 1
    end
end
