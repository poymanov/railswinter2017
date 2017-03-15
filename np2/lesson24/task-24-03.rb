# encoding: utf-8

def method
  c = 3

  puts "Переменная $a " + defined?($a).to_s
  puts "Переменная b " + defined?(b).to_s
  puts "Переменная c " + defined?(c).to_s
end

$a = 1
b = 2

method

puts "Переменная $a " + defined?($a).to_s
puts "Переменная b " + defined?(b).to_s
puts "Переменная c " + defined?(c).to_s