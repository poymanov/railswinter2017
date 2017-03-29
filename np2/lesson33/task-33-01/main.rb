# encoding: utf-8

require "json"

file = File.read("#{__dir__}/data.json", encoding: "UTF-8")

data = JSON.parse(file)

puts data["name"]
puts "#{data["phone"]}, #{data["email"]}"
puts data["description"]