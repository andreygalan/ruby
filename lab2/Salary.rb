class Salary

    def get_salary
    end
    
end

class Fix_sal < Salary

    def initialize(fixed)
        @fixed=fixed
    end

    def get_salary
        @fixed
    end
end

