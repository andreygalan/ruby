class Department
    attr_accessor :name, :phone_number

    def initialize(name,phone_number,duties=Hash.new,selected_duty=nil)
        @name = name
        @phone_number = phone_number
        @duties = duties
        @selected_duty = selected_duty
    end

    def to_s()
        "#{@name} | #{@phone_number}"
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
end


dep1 = Department.new("Танспорта","89185464615")
dep1.add_duty("1","qweqwe")
dep1.add_duty("3","qweqwe")
dep1.add_duty("2","qweqwe")
puts dep1.get_duties
dep2 = Department.new("Строительства","88612184615")
puts dep1
puts dep2