# encoding: utf-8

require_relative "human"

human_one = Human.new("Иван", "Иванов", 10)
human_two = Human.new("Фёдор", "Петров", 65)

puts "У нас есть два человека:"

puts human_one.fullname
puts human_one.age

puts human_two.fullname
puts human_two.age
