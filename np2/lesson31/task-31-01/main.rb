# encoding: utf-8

require_relative "lib/hashtags"

puts "Введите строку с хэштегами:"

user_input = STDIN.gets.chomp
result = hashtags(user_input)

puts "Нашли вот такие хэштеги: #{result}"