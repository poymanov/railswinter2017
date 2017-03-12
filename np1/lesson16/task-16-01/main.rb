# encoding: utf-8

current_path = File.dirname(__FILE__)
holidays_path = current_path + "/data/holidays.txt"

unless File.exist?(holidays_path)
  puts "Файл с праздниками не найден"
end

# Праздники
holidays_file = File.open(holidays_path, "r:UTF-8")
holidays = holidays_file.readlines

# Получаем текущий день недели
time = Time.now
wday = time.wday

# Вывод статуса текущего дня
if (wday != 0 || wday != 6)

else
  puts "Сегодня выходной!";
end

can_relax = nil

if wday == 0 || wday == 6
  can_relax = true
else
  # Поиск праздников
  current_day = time.strftime("%d.%m")

  for day in holidays
    puts day
    if day.chomp == current_day
      can_relax = true
      break
    end
  end
end

if can_relax
  puts "Сегодня выходной!";
else
  puts "Сегодня будний день, за работу!";
end