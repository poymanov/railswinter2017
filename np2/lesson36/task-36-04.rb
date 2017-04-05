# encoding: utf-8

require 'uri'
require 'net/http'
require 'rexml/document'

uri = URI.parse('http://www.cbr.ru/scripts/XML_daily.asp')

begin
  response = Net::HTTP.get_response(uri)
rescue Exception => error
  puts error.message
  abort "Не удалось получить курс"
end

doc = REXML::Document.new(response.body)

exchange_rate = nil

doc.root.elements.each do |currency|
  currency_code = currency.elements['NumCode'].text.to_i

  if currency_code == 840
    exchange_rate = currency.elements['Value'].text.to_f
    break
  end

end

if exchange_rate.nil?
  abort "не удалось получить курс доллара"
end

puts "Курс доллара: #{exchange_rate} руб."
puts

# Задаем пользователю вопросы
if (exchange_rate == 0.0)
  # Ошибочная ситуация
  abort "Недопустимое значение курса доллара"
end

puts "Сколько у вас рублей?"
rubles = gets.to_f

puts "Сколько у вас долларов?"
dollars = gets.to_f

# Будем считать, что мы хотим балансировать доллары

# Переводим рубли в доллары по текущему курсу
dollars_currect_exchange = (rubles / exchange_rate).round(2)

# Получаем абсолютную разницу между текущими долларами и долларами по курсу
difference = (dollars - dollars_currect_exchange).round(2).abs

# Условие, при котором портфель балансировать не нужно
if (difference < 1 || dollars == dollars_currect_exchange)
  puts "Портфель сбалансирован"
else
  # Определяем, нужно продать или купить доллары
  if (dollars > dollars_currect_exchange)
    puts "Вам нужно продать #{difference}$"
  else
    puts "Вам нужно купить #{difference}$"
  end
end