# encoding: utf-8

puts "Введите строку с хэштегами:"

user_input = STDIN.gets.chomp
regexp = /#[a-z_а-я0-9\-]+/i

results = user_input.scan(regexp)

puts "Нашли вот такие хэштеги: #{results.join(", ")}"