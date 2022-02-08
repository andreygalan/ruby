def getSumDigits
    number = ARGV[0].to_i
    digitsSum = 0
    while number > 0
        digitsSum += number % 10
        number /= 10
    end
    digitsSum
end

def getMaxDigit nubmer
    nubmer.digits.max
end

def getMinDigit nubmer
    nubmer.digits.min
end

def getMulDigit nubmer
    digitsMul = 1
    nubmer.digits.each{|i| digitsMul *= i }
    digitsMul
end

puts getMulDigit(273)
