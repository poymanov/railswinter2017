# encoding: utf-8

products = {
  "product1" => "2",
  "product2" => "3",
  "product3" => "4"
}

goods = {
  "good1" => "1",
  "good2" => "7",
  "good3" => "6"
}

products.merge!(goods)

puts "Общий список покупок"
puts

products.each_pair do | key, value |
  puts "#{key} - #{value} шт."
end