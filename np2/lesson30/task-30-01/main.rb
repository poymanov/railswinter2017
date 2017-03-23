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

file.close

puts "В этом сундуке хранятся ваши желания."
puts "Чего бы вы хотели?"

desire_text = STDIN.gets.chomp

puts 'До какого числа вы хотите осуществить это желание?'
puts '(укажите дату в формате ДД.ММ.ГГГГ)'
date_input = STDIN.gets.chomp

if date_input == ''
  desire_date = Date.today
else
  begin
    desire_date = Date.parse(date_input)
  rescue ArgumentError
    desire_date = Date.today
  end
end

desires = doc.elements.find('desires').first

desire = desires.add_element 'desire', {
  'date' => desire_date.strftime('%Y.%m.%d')
}


desire.text = desire_text

file = File.new(file_path, 'w:UTF-8')
doc.write(file, 2)
file.close

puts 'Ваше желание в сундуке'