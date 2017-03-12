# encoding: utf-8

puts "Введите номер телефона:"
user_input = STDIN.gets.chomp

regexp = /^\+*[0-9]+((\s\(*[0-9]{3}\)*)*\s[0-9\-]{3,}(\sдоб.\s[0-9]+)*)*$/

if user_input.match(regexp)
  puts "Спасибо!"
else
  puts "Это не номер телефона"
end