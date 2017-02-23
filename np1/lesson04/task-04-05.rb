# encoding: utf-8

# Получаем текущий день недели
wday = Time.now.wday

# Вывод статуса текущего дня
if (wday != 0 || wday != 6)
  puts "Сегодня будний день, за работу!";
else
  puts "Сегодня выходной!";
end