class Department
    attr_accessor :name, :phone_number
    def initialize(name,phone_number)
        @name = name
        @phone_number = phone_number
    end
    def to_s()
        "#{@name} | #{@phone_number}"
    end

end


dep1 = Department.new("Танспорта","89185464615")
dep2 = Department.new("Строительства","88612184615")
puts dep1
puts dep2