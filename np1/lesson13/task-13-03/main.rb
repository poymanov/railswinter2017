# encoding: utf-8

current_path = File.dirname(__FILE__)

# Пути к файлам
questions_path = current_path + "/data/questions.txt"
answers_path = current_path + "/data/answers.txt"

# Проверка существования файлов
unless File.exist?(questions_path)
  abort "Не найден файл с вопросами"
end

unless File.exist?(answers_path)
  abort "Не найден файл с ответами"
end

questions_file = File.new(questions_path, "r:UTF-8")
questions = questions_file.readlines
questions_file.close

answers_file = File.new(answers_path, "r:UTF-8")
answers = answers_file.readlines
answers_file.close

puts "Мини-викторина. Ответьте на вопросы."
puts

right_answers = 0

# Задаем вопросы
questions.each_with_index { |item, index|
  puts item

  user_answer = STDIN.gets.chomp
  answer = answers[index].chomp

  # Сравниваем ответы
  if user_answer == answer
    puts "Верный ответ!"
    right_answers += 1
  else
    puts "Неправильно. Правильный ответ: #{answer}"
  end
  puts
}

puts
puts "У вас #{right_answers} правильных ответов из #{questions.size}"