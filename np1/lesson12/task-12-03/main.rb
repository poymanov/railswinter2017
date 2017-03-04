# encoding: utf-8

require_relative "human"
require_relative "film"

array = []

human = Human.new("Сергей")
film = Film.new("Челюсти")
human.set_film(film)
array << human

human = Human.new("Марина")
film = Film.new("Список Шиндлера")
human.set_film(film)
array << human

human = Human.new("Мадонна")
film = Film.new("Парк Юрского периода")
human.set_film(film)
array << human

array.each do |person|
  puts person.name
  puts "с любимым фильмом: #{person.film.title}"
end
