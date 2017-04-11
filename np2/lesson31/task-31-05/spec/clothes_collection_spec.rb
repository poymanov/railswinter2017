require 'clothing'
require 'clothes_collection'

describe ClothesCollection do
  let(:clothes_collection) do
    current_path = File.dirname(__FILE__)
    dir_path = current_path + '/fixtures/clothes'
    clothes_collection = ClothesCollection.new(dir_path)
  end

  context '#initialize' do
    it 'initialize object with clothes data from directory' do
      current_path = File.dirname(__FILE__)
      dir_path = current_path + '/fixtures/clothes'
      clothes_collection = ClothesCollection.new(dir_path)

      expect(clothes_collection.clothes[0].name).to eq "Шапка-ушанка"
      expect(clothes_collection.clothes[0].type).to eq "Головной убор"
      expect(clothes_collection.clothes[0].temperature_from).to eq -20
      expect(clothes_collection.clothes[0].temperature_to).to eq -5

      expect(clothes_collection.clothes[1].name).to eq "Кросовки"
      expect(clothes_collection.clothes[1].type).to eq "Обувь"
      expect(clothes_collection.clothes[1].temperature_from).to eq 0
      expect(clothes_collection.clothes[1].temperature_to).to eq 15

      expect(clothes_collection.clothes[2].name).to eq "Черная куртка"
      expect(clothes_collection.clothes[2].type).to eq "Куртка"
      expect(clothes_collection.clothes[2].temperature_from).to eq -5
      expect(clothes_collection.clothes[2].temperature_to).to eq 10
    end
  end

  context '#types' do
    it 'returns array with types of clothings' do
      types = clothes_collection.types

      expect(types).to include('Головной убор')
      expect(types).to include('Обувь')
      expect(types).to include('Куртка')
    end
  end

  context '#clothes_by_type' do
    it 'returns array of all clothes by type argument' do
      clothes = clothes_collection.clothes_by_type('Головной убор')

      expect(clothes.any?).to be_truthy
    end
  end
end