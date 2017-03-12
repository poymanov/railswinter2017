# encoding: utf-8

require "translit"

puts "Введите фразу для транслитерации/обратной транслитерации:"

string = STDIN.gets.chomp
processed_string = Translit.convert(string)

puts processed_string