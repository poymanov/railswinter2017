# encoding: utf-8

require_relative "test"
require_relative "print_results"

# Запуск игры
game = Test.new
game.play

# Получение результатов
points = game.points

# Вывод результатов
puts "\nВаш результат #{points} баллов"
results = PrintResults.new(points)
puts results.print