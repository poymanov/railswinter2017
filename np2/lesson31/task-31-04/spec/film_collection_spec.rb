require 'film_collection'

describe FilmCollection do
  let(:film_collection) do
    current_path = File.dirname(__FILE__)
    films_path = current_path + "/fixtures/films"
    film_collection = FilmCollection.new(films_path)
  end

  context '#films_from_dir' do
    it 'returns 3 film from dir' do
      expect(film_collection.films.size).to eq 3
    end

    it 'returns 3 right films from dir' do
      expect(film_collection.films[0].film).to eq 'Остров проклятых'
      expect(film_collection.films[0].director).to eq 'Мартин Скорсезе'
      expect(film_collection.films[0].year).to eq '2009'

      expect(film_collection.films[1].film).to eq 'Волк с Уолл-стрит'
      expect(film_collection.films[1].director).to eq 'Мартин Скорсезе'
      expect(film_collection.films[1].year).to eq '2013'

      expect(film_collection.films[2].film).to eq 'Хоббит: Битва пяти воинств'
      expect(film_collection.films[2].director).to eq 'Питер Джексон'
      expect(film_collection.films[2].year).to eq '2014'
    end
  end

  context '#directors' do
    it 'returns 2 films directors' do
      expect(film_collection.directors.size).to eq 2
    end

    it "returns 2 uniq right directors" do
      directors = film_collection.directors

      expect(directors.include?('Питер Джексон')).to be_truthy
      expect(directors.include?('Мартин Скорсезе')).to be_truthy
    end
  end

  context '#films_by_director' do
    it 'returns 2 films by Martin Scorsese' do
      films = film_collection.films_by_director('Мартин Скорсезе')

      expect(films.size).to eq 2
    end

    it 'returns 2 right films by Martin Scorsese' do
      films = film_collection.films_by_director('Мартин Скорсезе')
      films_array = films.map { |film| film.film}

      expect(films_array.include?('Волк с Уолл-стрит')).to be_truthy
      expect(films_array.include?('Остров проклятых')).to be_truthy
    end
  end
end