def getSumDigits
    number = ARGV[0].to_i
    digitsSum = 0
    while number > 0
        digitsSum += number % 10
        number /= 10
    end
    digitsSum
end

def getMaxDigit number
    number.digits.max
end

def getMinDigit number
    number.digits.min
end

def getMulDigit number
    digitsMul = 1
    number.digits.each{|i| digitsMul *= i }
    digitsMul
end

def gcd a,b
    while b != 0
        a,b = b,a % b
    end
    a
end

def method1 number
couter = 0
    (2..number).each{ |i| 
 couter +=1 if gcd(i,number) == 1
}
couter
end

def method2 number
    digitsSum = 0
    number.digits.each{|i| digitsSum += i if i%3 == 0}
    digitsSum
end

puts method2(239)
