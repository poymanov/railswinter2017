# encoding: utf-8

puts "Введите email:"

string = STDIN.gets.chomp

if string =~ /[a-z0-9\.]+@[a-z0-9]+\.[a-z]+/i
  puts "Спасибо!"
else
  puts "Какая-то фигня!"
  puts "Это не email"
end