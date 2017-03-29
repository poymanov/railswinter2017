require_relative "../lib/film"

class FilmCollection
  attr_reader :films

  def initialize(path)
    unless Dir.exist?(path)
      abort "Не найден каталог с фильмами"
    end

    @path = path
    @films = []

    films_from_dir
  end

  # Получение фильмов
  def films_from_dir
    # Перебор файлов с фильмами
    Dir[@path + '/*.txt'].sort.each do |file_path|
      # Создание фильма
      film = Film.new(file_path)

      @films << film
    end
  end

  # Получение списка режиссеров из фильмов
  def directors
    directors = []

    @films.each do |film|
      directors << film.director
    end

    directors.uniq
  end

  # Получение фильмов по режиссеру
  def films_by_director(director)
    director_films = []

    @films.each do |film|
      if film.director == director
        director_films << film
      end
    end

    director_films
  end
end