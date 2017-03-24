class Game
  attr_reader :questions

  def initialize(questions)
    @questions = questions
    @right_answers = 0
  end

  # Запуск игры
  def play
    abort "Вопросы не обнаружены" if @questions.size == 0

    puts "Мини-викторина. Ответьте на вопросы."
    puts

    @questions.each do |question|
      # Вывод вопроса
      puts question.text

      # Вывод вариантов ответов
      question.show_question_variants()

      puts "Время на ответ #{question.max_time} мин."
      puts

      # Обработка ответа пользователя
      answer_status = proccess_user_input(question)

      if answer_status
        puts "Верный ответ!"
        puts
        @right_answers += 1
      else
        puts "Неправильно. Правильный ответ: #{question.right_variant}"
        puts
      end
    end

    puts "У вас #{@right_answers} правильных ответов из #{@questions.size}"
  end

  # Обработка ответа пользователя
  def proccess_user_input(question)
    max_time_sec = question.max_time * 60

    # Время начала ответа на вопрос
    time_begin = Time.now

    user_answer = STDIN.gets.chomp

    # Время окончания ответа на вопрос
    time_end = Time.now

    # Время потраченное на ответ
    time_spent = (time_end - time_begin).round

    if time_spent > max_time_sec
      abort "На ответ потрачено более #{question.max_time} мин. Игра завершена."
    end

    user_answer == question.right_variant
  end
end