def get_sum_digits number
    number.digits.sum
    
end

def get_max_digit number
    number.digits.max
end

def get_min_digit number
    number.digits.min
end

def get_mul_digit number
    digits_mul = 1
    number.digits.each{|i| digits_mul *= i }
    digits_mul
end

def gcd a,b
    while b != 0
        a,b = b,a % b
    end
    a
end

def method1 number
couter = 0
    (2..number).each{ |i|  couter +=1 if gcd(i,number) == 1}
couter
end

def method2 number
    digitsSum = 0
    number.digits.each{|i| digitsSum += i if i % 3 == 0}
    digitsSum
end

def method3 number
    divisor=0
    divisor_prime_count=0
    (2..number-1).each{|i|   
        acc=0
        number.digits.each{|digit|  
        acc += 1 if gcd(i,digit) == 1 } if number % i == 0
        if acc>divisor_prime_count 
            divisor_prime_count=acc
            divisor=i
        end
    }
    divisor
end
number = ARGV[1].to_i

case ARGV[0]

when '1'
    puts get_sum_digits number
when '2'
    puts get_max_digit number

when '3'
    puts get_min_digit number
when '4'
    puts get_mul_digit number
when '5'
    puts method1 number
when '6'
    puts method2 number
when '7'
    puts method3 number
else
    puts 'Hello World'
end


