number = ARGV[0].to_i
digitsSum = 0
while number > 0
    digitsSum += number % 10
    number /= 10
end
puts digitsSum.to_s