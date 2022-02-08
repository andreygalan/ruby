if ARGV.length >= 1
    puts "Привет, #{ARGV[0]}!"
else
    puts "Привет"
end

puts String.methods

puts "Введите ваш любимый язык: "
answer = STDIN.gets.chomp
case answer
    when "ruby"
        puts "Подлиза"
    when "python"
        puts "Переключайтесь на ruby"
    when "c++"
        puts "Хороший язык, молодец. Но ruby скоро станет вышим любимым"
    when "c#"
        puts "Хороший язык, но ruby лучше"
    else
        puts "В любом случае, скоро будет  ruby"
end
