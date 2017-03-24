class Question
  attr_reader :text, :max_time, :variants, :right_variant

  def initialize(text, max_time, variants, right_variant)
    @text = text
    @max_time = max_time
    @variants = variants
    @right_variant = right_variant
  end

  # Получение массива вопросов из xml
  def self.parse_xml(file_path)
    abort "Не найден файл с данными" unless File.exist?(file_path)

    questions = []

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
      questions << self.new(text, max_time, variants, right_variant)
    end

    questions
  end

  # Вывод вариантов ответа на вопрос
  def show_question_variants()
    variants.shuffle!

    variants.each do |variant|
      puts variant
    end
  end
end