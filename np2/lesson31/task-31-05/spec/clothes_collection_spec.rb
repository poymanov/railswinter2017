require 'clothing'
require 'clothes_collection'

describe 'ClothesCollection Class' do
  let(:clothes_collection) do
    current_path = File.dirname(__FILE__)
    dir_path = current_path + '/fixtures/clothes'
    clothes_collection = ClothesCollection.new(dir_path)
  end

  it 'returns clothes from file' do
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

  context '#types' do
    it 'returns clothes types' do
      types = clothes_collection.types

      expect(types).to include('Головной убор')
      expect(types).to include('Обувь')
      expect(types).to include('Куртка')
    end
  end

  context '#clothes_by_type' do
    it 'returns clothing by type' do
      clothes = clothes_collection.clothes_by_type('Головной убор')

      is_clothing = false

      clothes.each do |item|
        if item.name == "Шапка-ушанка" &&
           item.type == "Головной убор" &&
           item.temperature_from == -20 &&
           item.temperature_to == -5
           is_clothing = true
           break
        end
      end

      expect(is_clothing).to be_truthy
    end
  end
end