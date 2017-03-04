# encoding: utf-8

require_relative "credit"

# Запрос данных
puts "Сейчас мы оценим, достойны ли вы получить кредит в нашем великолепном банке"
puts

puts "Ваш возраст?"
age = STDIN.gets.to_i

puts "Ваш пол? 1 - мужчина, 2 - женщина"
sex = STDIN.gets.to_i

puts "Ваш доход?"
income = STDIN.gets.to_i

puts "Кредитная история? 1 - есть, 2 - нет"
history = STDIN.gets.to_i

puts "Запрашиваемая сумма?"
amount = STDIN.gets.to_i

credit = Credit.new(age, sex, income, history, amount)

puts "Подождите, пока решается ваша судьба"
puts
sleep 2

if credit.approve?
  puts "Поздравляем! Вы официально стали нашим рабом!"
else
  puts "Вам отказано в кредите"
end