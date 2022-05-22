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

class Rub_sal < Fix_sal

    def initialize(fixed,add_rub)
        super(fixed)
        @add_rub = add_rub
    end

    def get_salary
        super + @add_rub
    end
    
end

class Percent_sal < Fix_sal

    def initialize(fixed,add_percent)
        super(fixed)
        @add_percent=add_percent      
    end

    def get_salary
            fixed = super
        if rand(2)==1
            fixed + fixed * @add_percent
        else
            fixed 
        end

    end
end

class Rub_percent_sal < Percent_sal

    def initialize(fixed,add_percent,add_rub)
        super(fixed,add_percent)
        @add_rub = add_rub
        
    end

    def get_salary
        super + @add_rub
    end
end

