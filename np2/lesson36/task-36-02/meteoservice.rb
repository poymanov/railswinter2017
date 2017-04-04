# encoding: utf-8
#
# Программа «Прогноз погоды» Версия 1.0
#
# Данные берем из XML метеосервиса
# http://www.meteoservice.ru/content/export.html
#
# (с) goodprogrammer.ru и Александр Кузьмин

# Подключаем библиотеку для работы c адресами URI
require 'uri'

# Подключаем библиотеку для загрузки данных по http-протоколу
require 'net/http'

# Подключаем библиотеку для парсинга XML
require 'rexml/document'

require 'date'

# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Массив строк для облачности, описанный на сайте метеосервиса
CLOUDINESS = %w(Ясно Малооблачно Облачно Пасмурно).freeze

TOD = %w(ночь утро день вечер).freeze

TOWNS = {
  '37' => 'Москва',
  '59' => 'Пермь',
  '69' => 'Санкт-Петербург',
  '99' => 'Новосибирск',
  '115' => 'Орёл',
  '121' => 'Чита',
  '141' => 'Братск',
  '199' => 'Краснодар'
}

puts "Погоду для какого города Вы хотите узнать?"

towns_variants = TOWNS.values

towns_variants.each_with_index do |value, index|
  puts "#{index + 1}. #{value}"
end

user_input = STDIN.gets.to_i

choice_city = TOWNS.key(towns_variants[user_input - 1])

city_url = "http://xml.meteoservice.ru/export/gismeteo/point/#{choice_city}.xml"

# Сформируем адрес запроса с сайта метеосервиса
#
# 37 - Москва, адрес для своего города можно получить здесь:
#
# http://www.meteoservice.ru/content/export.html
uri = URI.parse(city_url)

# Отправляем HTTP-запрос по указанному адресу и записываем ответ в переменную
# response.
response = Net::HTTP.get_response(uri)

# Из тела ответа (body) формируем XML документ с помощью REXML парсера
doc = REXML::Document.new(response.body)

# Получаем имя города из XML, город лежит в ноде REPORT/TOWN
city_name = URI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])

# Достаем все XML тэги <FORECAST> внутри <TOWN>
forecasts = doc.root.elements['REPORT/TOWN'].elements

today = Date.today.to_s

puts city_name
puts

forecasts.each do |forecast|
  # Записываем минимальное и максимальное значение температуры из аттрибутов min
  # и max вложенного в элемент FORECAST тэга TEMPERATURE
  min_temp = forecast.elements['TEMPERATURE'].attributes['min'].to_i
  max_temp = forecast.elements['TEMPERATURE'].attributes['max'].to_i

  min_temp = "+#{min_temp}" if min_temp > 0
  max_temp = "+#{max_temp}" if max_temp > 0

  # Записываем максимальную скорость ветра из атриубута max тэга WIND
  max_wind = forecast.elements['WIND'].attributes['max']

  # Достаем из тега PHENOMENA атрибут cloudiness и по его значению находим строку
  # с обозначением облачности из массива CLOUDINESS
  clouds_index = forecast.elements['PHENOMENA'].attributes['cloudiness'].to_i
  clouds = CLOUDINESS[clouds_index]

  tod_index = forecast.attributes['tod'].to_i
  tod = TOD[tod_index]

  forecast_day = forecast.attributes['day'].to_i
  forecast_month = forecast.attributes['month'].to_i
  forecast_year = forecast.attributes['year'].to_i

  forecast_date = Date.parse("#{forecast_year}-#{forecast_month}-#{forecast_day}")

  if today == forecast_date.strftime("%Y-%m-%d")
    forecast_date = "Сегодня"
  else
    forecast_date = forecast_date.strftime("%d.%m.%Y")
  end

  # Выводим всю информацию на экран
  puts "#{forecast_date}, #{tod}"
  puts "#{min_temp} до #{max_temp}, ветер #{max_wind} м/с, #{clouds}"
  puts
end