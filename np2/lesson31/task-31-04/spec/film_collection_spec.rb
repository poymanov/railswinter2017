require 'rspec'
require_relative '../lib/film_collection'

describe 'FilmCollection Class' do
  current_path = File.dirname(__FILE__)
  films_path = current_path + "/fixtures/films"

  context '#films_from_dir' do
    it 'returns 3 film from dir' do
      film_collection = FilmCollection.new(films_path)
      expect(film_collection.films.size).to eq 3
    end

    it 'returns 3 right films from dir' do
      film_collection = FilmCollection.new(films_path)

      films = [
        {
          film: "Волк с Уолл-стрит",
          director: "Мартин Скорсезе",
          year: "2013"
        },
        {
          film: "Остров проклятых",
          director: "Мартин Скорсезе",
          year: "2009"
        },
        {
          film: "Хоббит: Битва пяти воинств",
          director: "Питер Джексон",
          year: "2014"
        }
      ]

      right_films = []

      film_collection.films.each do |film|
        films.each do |needed_film|
          if film.film == needed_film[:film] &&
             film.director == needed_film[:director] &&
             film.year == needed_film[:year]
             right_films << film
          end
        end
      end

      expect(right_films.size).to eq films.size
    end
  end

  context '#directors' do
    it 'returns 2 films directors' do
      film_collection = FilmCollection.new(films_path)
      expect(film_collection.directors.size).to eq 2
    end

    it "returns 2 uniq right directors" do
      film_collection = FilmCollection.new(films_path)
      directors = film_collection.directors

      expect(directors.include?('Питер Джексон')).to be_truthy
      expect(directors.include?('Мартин Скорсезе')).to be_truthy
    end
  end

  context '#films_by_director' do
    it 'returns 2 films by Martin Scorsese' do
      film_collection = FilmCollection.new(films_path)
      films = film_collection.films_by_director('Мартин Скорсезе')

      expect(films.size).to eq 2
    end

    it 'returns 2 right films by Martin Scorsese' do
      film_collection = FilmCollection.new(films_path)
      films = film_collection.films_by_director('Мартин Скорсезе')
      films_array = films.map { |film| film.film}

      expect(films_array.include?('Волк с Уолл-стрит')).to be_truthy
      expect(films_array.include?('Остров проклятых')).to be_truthy
    end
  end
end