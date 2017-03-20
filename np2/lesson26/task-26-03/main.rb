# encoding: utf-8

require_relative 'lib/clothes_collection'
require_relative 'lib/clothing'

current_path = File.dirname(__FILE__)
clothes_path = current_path + "/data"

# Одежда из каталога
clothes_collection = ClothesCollection.new(clothes_path)

puts "Сколько градусов за окном? (можно с минусом)"
temperature = STDIN.gets.to_i

puts "Предлагаем сегодня надеть:"
puts

# Перебор всех типов одежды
output = clothes_collection.types.map do |type|
  # Одежда по типу
  clothes = clothes_collection.clothes_by_type(type)

  # Проверка на соответствие погоде
  clothes_for_temperature = clothes.select do |item|
    item.available_for_temperature?(temperature)
  end

  # Добавление в набор случайной вещи
  clothes_for_temperature.sample
end

# Вывод набора

if output.size > 0
  output.each do |item|
    puts item.info if item
  end
else
  puts "Вам нечего одеть. Лучше остаться дома."
end