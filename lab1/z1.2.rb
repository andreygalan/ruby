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

testIf = 52;

if testIf == 41
    puts "Ветвь if - true."

elsif testIf == 52
    puts "Ветвь if - elsif."

else
    puts "Ветвь if - false."

end

unless testIf == 41
    puts "Ветвь unless."

else
    puts "Ветвь else - unless."

end

puts "if 4 < 10" if 4 < 10
puts "unless 4 > 10" unless 4 > 10

puts "Введите команду ОС:"
commandos = STDIN.gets.chomp
system commandos

puts "Введите команду ruby:"
commandruby = STDIN.gets.chomp
eval commandruby 