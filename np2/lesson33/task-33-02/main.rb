# encoding: utf-8

require "json"

file = File.read("#{__dir__}/data.json", encoding: "UTF-8")

data = JSON.parse(file)

# Максимальное количество вакансий
max_vacancies = data.key(data.values.max)

puts "Самый популярный язык: #{max_vacancies} (#{data[max_vacancies]})"

sorted_array = data.sort_by { |k, v| -v }
puts

sorted_array.each_with_index do |item, index|
  puts "#{index + 1}: #{item[0]} (#{item[1]})"
end


# data.each_pair do |key, value|
#   puts "#{key} (#{value})"
# end

