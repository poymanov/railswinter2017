class Game
  attr_reader :questions

  def initialize(file_path)
    abort "Не найден файл с данными" unless File.exist?(file_path)

    @questions = []
    @right_answers = 0

    parse_xml(file_path)
  end

  # Получение вопросов из xml
  def parse_xml(file_path)
    file = File.new(file_path, "r:UTF-8")
    doc = REXML::Document.new(file)
    file.close

    doc.elements.each('questions/question') do |item|
      # Данные вопроса
      max_time = item.attributes['minutes'].to_i
      text = item.elements['text'].text
      right_variant = nil

      variants = []

      # Варианты ответов
      item.elements.each('variants/variant') do |variant|
        variants << variant.text

        # Правильный вариант
        if variant.attributes['right']
          right_variant = variant.text
        end
      end

      # Создание вопроса
      @questions << Question.new(
        text: text,
        max_time: max_time,
        variants: variants,
        right_variant: right_variant
      )
    end
  end

  # Запуск игры
  def play
    abort "Вопросы не обнаружены" unless @questions

    puts "Мини-викторина. Ответьте на вопросы."
    puts

    @questions.each do |question|
      # Вывод вопроса
      puts question.text

      question.variants.shuffle!

      question.variants.each do |variant|
        puts variant
      end

      # Ожидание вврода пользователя
      user_answer = Thread.new do
        puts
        puts "Время на ответ #{question.max_time} мин."
        Thread.current[:value] = STDIN.gets.chomp
      end

      timer = Thread.new { sleep question.max_time * 60; user_answer.kill; puts }

      user_answer.join

      if user_answer[:value]
        # Пользователь ввел ответ
        if user_answer[:value] == question.right_variant
          puts "Верный ответ!"
          puts
          @right_answers += 1
        else
          puts "Неправильно. Правильный ответ: #{question.right_variant}"
          puts
        end
      else
        # Время истекло
        abort "Время вышло. Игра завершена"
      end
    end

    puts "У вас #{@right_answers} правильных ответов из #{@questions.size}"
  end
end