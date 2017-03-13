# encoding: utf-8

puts "Сколько раз вывести время?"

# Количество раз вывода времени
user_choice = STDIN.gets.to_i
user_choice = 10 if user_choice == 0

# Вывод времени
user_choice.times do
  puts Time.now

  # Задержка времени на секунду
  sleep 1
end
