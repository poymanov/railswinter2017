# encoding: utf-8

# Переменные
exchangeRate = nil
rubles = nil
dollars = nil

# Задаем пользователю вопросы
puts "Курс доллара?"
exchangeRate = gets.to_f

puts "Сколько у вас рублей?"
rubles = gets.to_f

puts "Сколько у вас долларов?"
dollars = gets.to_f

# Будем считать, что мы хотим балансировать доллары

# Переводим рубли в доллары по текущему курсу
dollarsCurrectExchange = (rubles / exchangeRate).round(2)

# Получаем абсолютную разницу между текущими долларами и долларами по курсу
difference = (dollars - dollarsCurrectExchange).round(2).abs

# Определяем, нужно продать или купить доллары
if (dollars > dollarsCurrectExchange)
  puts "Вам нужно продать #{difference}$"
else
  puts "Вам нужно купить #{difference}$"
end