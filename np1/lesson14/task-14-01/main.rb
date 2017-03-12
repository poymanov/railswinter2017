# encoding: utf-8

current_path = File.dirname(__FILE__)

questions_path = current_path + "/data/questions.txt"
results_path = current_path + "/data/results.txt"

# Проверки существования файлов
unless File.exist?(questions_path)
  abort "Файл с вопросами не найден"
end

unless File.exist?(results_path)
  abort "Файл с результатми не найден"
end

# Получение массивов с вопросами и результатами
questions_file = File.new(questions_path, "r:UTF-8")
questions = questions_file.readlines
questions_file.close

results_file = File.new(results_path, "r:UTF-8")
results = results_file.readlines
results_file.close

# Баллы
count = 0

# Перебор вопросов
questions.each do |question|
  puts question

  answer = nil

  # Ответ пользователя
  until answer == "а" || answer == "б" || answer == "в"
    puts "а - да, б - нет, в - иногда"
    answer = STDIN.gets.chomp.downcase
  end

  # Подсчет баллов
  if answer == "а"
    count += 2
  elsif answer == "в"
    count += 1
  end
end

# Вывод результатов
puts "\nВаш результат #{count} баллов"

if count >= 30 && count <= 32
  puts results[0]
elsif count >= 25 && count <= 29
  puts results[1]
elsif count >= 19 && count <= 24
  puts results[2]
elsif count >= 14 && count <= 18
  puts results[3]
elsif count >= 9 && count <= 13
  puts results[4]
elsif count >= 4 && count <= 8
  puts results[5]
elsif count <= 3
  puts results[6]
end