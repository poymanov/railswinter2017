# encoding: utf-8

# Переменные для хранения курса, рублей и значения запасов в рублях
exchange_rate = nil
rubles = nil
money = nil

# Запрашиваем курс
puts "Сколько сейчас стоит 1 доллар в рублях?";
exchange_rate = gets.to_f

# Запрашиваем количество рублей
puts "Сколько  у вас рублей?"
rubles = gets.to_f

# Подсчитываем итоговое количесто денег
money = (rubles / exchange_rate).round(2)

# Вывод итоговое значение
puts "Ваши запасы равны: $" + money.to_s