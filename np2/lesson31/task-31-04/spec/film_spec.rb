require 'rspec'
require_relative '../lib/film'

describe 'Film Class' do
  current_path = File.dirname(__FILE__)

  context '#initialize' do
    it 'create new instance' do
      film_path = current_path + "/fixtures/films/film01.txt"
      film = Film.new(film_path)

      expect(film.film).to eq "Волк с Уолл-стрит"
      expect(film.director).to eq "Мартин Скорсезе"
      expect(film.year).to eq "2013"
    end
  end

  context '#info' do
    it 'returns right information' do
      film_path = current_path + "/fixtures/films/film01.txt"
      film = Film.new(film_path)

      expect(film.info).to eq "Мартин Скорсезе - Волк с Уолл-стрит (2013)"
    end
  end
end