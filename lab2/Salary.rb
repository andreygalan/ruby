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

class Fine_sal < Fix_sal

    def initialize(fixed,fine)
        super(fixed)
        @fine = fine
    end

    def get_salary
        super - @fine
    end

end

class Fine_rub_sal < Rub_sal
    def initialize(fixed,add_rub,fine)
        super(fixed,add_rub)
        @fine = fine
    end
        
    def get_salary 
        super - @fine
    end
end

class Fine_percent_sal < Percent_sal
    def initialize(fixed,add_percent,fine)
        super(fixed,add_percent)
        @fine = fine
    end
        
    def get_salary 
        super - @fine
    end
end

class Premium_sal < Fix_sal
    def initialize(fixed,add_premium)
        super(fixed)
        @add_premium=add_premium
    end

    def get_salary
        super + @add_premium
    end
end


class Fine_rub_percent_sal < Rub_percent_sal
    def initialize(fixed,add_percent,add_rub,fine)
        super(fixed,add_percent,add_rub)
        @fine = fine
    end
        
    def get_salary 
        super - @fine
    end
end


