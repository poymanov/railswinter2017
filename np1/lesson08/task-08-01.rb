# encoding: utf-8

params = ARGV

if params[0] == nil || params[1] == nil
  # Аргументы отсутствуют
  puts "Какая сейчас температура?"
  temperature = STDIN.gets.to_i

  puts "Какое время года? (0 - весна, 1 - лето, 2 - осень, 3 - зима)"
  season = STDIN.gets.to_i
else
  # Аргументы указаны
  temperature = params[0].to_i
  season = params[1].to_i
end

# Определение состояния
if (season == 1 && temperature >= 15 && temperature <= 35) || 
   (temperature >= 22 && temperature <= 30)
   puts "Скорее идите в парк, соловьи поют!"
else
  puts "Сейчас соловьи молчат, греются или прохлаждаются :)"
end