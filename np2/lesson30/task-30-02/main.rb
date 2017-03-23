# encoding: utf-8

require 'rexml/document'
require 'date'

current_path = File.dirname(__FILE__)

file_path = current_path + '/data.xml'

file = File.new(file_path, 'r:UTF-8')

begin
  doc = REXML::Document.new(file)
rescue REXML::ParseException => error
  puts 'XML файл похоже битый :('
  abort error.message
end

expired_wishes = []
coming_wishes = []

date_now = Date.today

# Сбор данных желаний
doc.elements.each('desires/desire') do |item|
  text = item.text.strip
  due_date = Date.parse(item.attributes['date'])

  # Определение массива для записи желания
  destination_array = due_date < date_now ? expired_wishes : coming_wishes

  destination_array << {
    text: text,
    date: due_date
  }
end

# Просроченные желания
if expired_wishes.size > 0
  puts "Эти желания должны уже были сбыться к сегодняшнему дню:"
  expired_wishes.each do |item|
    puts "#{item[:date]}: #{item[:text]}"
  end
else
  puts "Нет желаний, которые должны были сбыться к сегодняшнему дню"
end

puts

# Грядущие желания
if coming_wishes.size > 0
  puts "А этим желаниям ещё предстоит сбыться:"
  coming_wishes.each do |item|
    puts "#{item[:date]}: #{item[:text]}"
  end
else
  puts "Нет желаний, которым предстоит сбыться"
end
