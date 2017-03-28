require 'film'

describe Film do
  let(:film) do
    current_path = File.dirname(__FILE__)
    Film.new(current_path + "/fixtures/films/film01.txt")
  end

  context '#initialize' do
    it 'creates new instance' do
      expect(film.film).to eq "Волк с Уолл-стрит"
      expect(film.director).to eq "Мартин Скорсезе"
      expect(film.year).to eq "2013"
    end
  end

  context '#info' do
    it 'returns right information' do
      expect(film.info).to eq "Мартин Скорсезе - Волк с Уолл-стрит (2013)"
    end
  end
end