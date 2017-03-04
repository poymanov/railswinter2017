# encoding: utf-8

# Отрезание элементов массива
def chop(array, qty)
  new_array = []

  count = 0

  size = array.size

  while count < qty && count < size do
    new_array.push array[count]
    count += 1
  end

  return new_array
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

puts "Вот какая палка колбасы у нас есть:"
puts array.to_s

puts "Сколько первых элементов вам отрезать?"
qty = STDIN.gets.to_i

puts "Вот ваша колбаса:"
puts chop(array, qty).to_s