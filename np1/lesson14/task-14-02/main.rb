# encoding: utf-8

require_relative "film_collection"

current_path = File.dirname(__FILE__)
films_path = current_path + "/data"

# Фильмы из каталога
film_collection = FilmCollection.new(films_path)

# Списков режиссеров
directors = film_collection.directors

puts "Программа «Фильм на вечер»"
puts

count = 1

for director in directors
  puts "#{count}: #{director}"
  count += 1
end

puts
puts "Фильм какого режиссера вы хотите сегодня посмотреть?"

# Выбранный режиссер
user_choice = STDIN.gets.to_i
choice_director = directors[user_choice-1]

# Фильмы режиссера
director_films = film_collection.films_by_director(choice_director)
choice_film = director_films.sample

puts
puts "И сегодня вечером рекомендую посмотреть:"
puts choice_film.info