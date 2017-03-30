# encoding: utf-8

require "json"

file = File.read("#{__dir__}/data/mendeleev-table.json", encoding: "UTF-8")

data = JSON.parse(file)

# Элементы для выбора
puts "У нас всего элементов: #{data.keys.size}"
puts
puts data.keys.join(", ")

# Запрос элемента
puts
puts "О каком элементе хотите узнать?"
element = STDIN.gets.chomp.capitalize
puts

# Вывод результатов
if data.key?(element)
  current_element = data[element]
  puts "Порядковый номер: #{current_element['number']}"
  puts "Название: #{current_element['name']}"
  puts "Первооткрыватель: #{current_element['discoverer']} (#{current_element['year']})"
  puts "Плотность: #{current_element['density']} кг/м³"
else
  puts "Извините, про такой элемент мы еще не знаем."
end