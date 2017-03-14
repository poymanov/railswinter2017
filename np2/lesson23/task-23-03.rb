# encoding: utf-8

require 'digest'

puts "Введите слово или фразу для шифрования:"
phrase = STDIN.gets.chomp

crypt_methods = ['MD5', 'SHA1']

puts "Каким способом зашифровать:"

crypt_methods.each_with_index do |item, index|
  puts "#{index + 1}. #{item}"
end

user_input = STDIN.gets.to_i

case crypt_methods[user_input - 1]
  when crypt_methods[0] then puts Digest::MD5.hexdigest phrase
  when crypt_methods[1] then puts Digest::SHA1.hexdigest phrase
  else
    puts "Неизвестный метод шифрования"
end