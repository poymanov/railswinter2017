# encoding: utf-8

# Список покупок
shoplist = ["масло", "молоко", "хлопья", "картошка", "курица", "помидоры"]

puts "Нужно купить"
puts shoplist.to_s

while shoplist.size > 0 do
  # Спрашиваем что купили, пока массив не станет пустым
  puts "Что купили?"

  # Получаем ответ пользователя
  product = gets.encode("UTF-8").chomp

  # Удаляем покупку из списка
  shoplist.delete(product)

  # Отображаем список того, что нужно купить  
  puts "Нужно еще купить:"
  puts shoplist.to_s
end

# Пользователь уже все купил
puts "Вы купили все необходимое"