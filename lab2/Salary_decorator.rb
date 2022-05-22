class Salary_decorator
    def initialize(target)
        @target = target
    end

    def get_salary
        
    end

    def self.get_instance(fixed,add_rub,percent,...)
        instance = Fixed_sal.new(fixed)
        if add_rub = 0 then
            instance = 
        end


        instance
    end

end


class Fix_sal

    def initialize(fixed)
        @fixed=fixed
    end

    def get_salary
        @fixed
    end
end

class Rub_sal < Salary_decorator

    def initialize(target,add_rub)
        @target=target
        @add_rub=add_rub
    end

    def get_salary
        @target.get_salary + @add_rub
    end
end

class Percent_sal < Salary_decorator

    def initialize(target,add_percent)
        @target=target
        @add_percent=add_percent      
    end

    def get_salary
            fixed = @target.get_salary
        if rand(2)==1
            fixed + fixed * @add_percent
        else
            fixed 
        end

    end
end

class Fine_sal < Salary_decorator

    def initialize(target,fine)
        @target = target
        @fine = fine
    end

    def get_salary
        @target.get_salary - @fine
    end

end

class Premium_sal < Salary_decorator
    def initialize(target,add_premium)
        @target = target
        @add_premium=add_premium
    end

    def get_salary
        @target.get_salary + @add_premium
    end
end


salary = Fix_sal.new(10000)
salary = Premium_sal.new(salary,1000)
salary = Rub_sal.new(salary,10000)
puts salary.get_salary