# encoding: utf-8

require_relative "human"

human_one = Human.new("Гаврила", "Петрович")
human_two = Human.new("Фёдор", "Петрович")
human_three = Human.new("Василий", "Алибабаевич")

puts "У нас есть три человека:"

puts human_one.fullname
puts human_two.fullname
puts human_three.fullname