class Department
    attr_accessor :name 
    attr_reader :phone_number

    def initialize(name,phone_number,duties=Hash.new,selected_duty=nil)
        @name = name
        self.phone_number= phone_number
        @duties = duties
        @selected_duty = selected_duty
    end

    def phone_number=(phone_number)
        if not Department.is_phone_number?(phone_number)
            raise "Некорректный номер телефона"
        end
        phone_number.gsub!(/^8/, "7")
        @phone_number = phone_number.delete("- )(+")
    end

    def to_s()
        "#{@name} | #{@phone_number} | #{self.get_duties()}"
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

    def self.is_phone_number?(phone_number)
        return phone_number.scan(/^(\s*)?(\+?7|8)([(\- ]?\d{3}[)\- ]?)(\d{3}[\- ]?\d{2}[\- ]?\d{2}|\d{2}[\- ]?\d{3}[\- ]?\d{2})(\s*)?$/).length == 1
    end
end


dep1 = Department.new("Танспорта","+7(918)5464615")
dep1.add_duty("1","qweqwe")
dep1.add_duty("3","qweqwe")
dep1.add_duty("2","qweqwe")
dep1.add_duty("4","qweqwe")
dep1.select_duty("3")
dep1.delete_duty
dep1.select_duty("4")
dep1.change_specification("fgvghtr")
dep2 = Department.new("Строительства","88612184615")
puts dep1.get_specification
puts dep1
puts dep2