# encoding: utf-8

# Исходный массив
array = [1, 2, 3, 4, 5]

puts "Исходный массив:"
puts array.to_s

puts

# Массив в обратном порядке
puts "Массив в обратном порядке:"
puts array.reverse.to_s

puts

# Исходный массив (не изменился)
puts "Исходный массив (не изменился):"
puts array.to_s

puts

# Исходный массив (изменился):
puts "Исходный массив (изменился):"
array.reverse!

puts array.to_s