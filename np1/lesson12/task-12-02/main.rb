# encoding: utf-8

require_relative "film"

puts "Фильмы какого режиссера Вы хотите посмотреть?"

# Режиссер
director = STDIN.gets.chomp

# Массив для фильмов
array = []

3.times do
  # Получение фильмов
  puts "Какой-нибудь его хороший фильм?"
  user_input = STDIN.gets.chomp

  # Создание фильма
  film = Film.new(director, user_input)

  # Добавление в массив
  array << film

end

# Выбор случайного фильма

random_film = array.sample

puts "И сегодня вечером рекомендую посмотреть: #{random_film.title}"
puts "Режиссера: #{random_film.director}"