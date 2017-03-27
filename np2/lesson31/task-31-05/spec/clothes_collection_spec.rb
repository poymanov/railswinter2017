require 'rspec'
require_relative '../lib/clothing'
require_relative '../lib/clothes_collection'

describe 'ClothesCollection Class' do
  current_path = File.dirname(__FILE__)
  dir_path = current_path + '/fixtures/clothes'

  context '#clothes_from_dir' do
    it 'returns 3 clothes' do
      clothes_collection = ClothesCollection.new(dir_path)

      expect(clothes_collection.clothes.size).to eq 3
    end

    it 'returns 3 right clothes' do
      clothes_collection = ClothesCollection.new(dir_path)

      clothes = [
        {
          name: "Шапка-ушанка",
          type: "Головной убор",
          temperature_from: -20,
          temperature_to: -5
        },
        {
          name: "Кросовки",
          type: "Обувь",
          temperature_from: 0,
          temperature_to: 15
        },
        {
          name: "Черная куртка",
          type: "Куртка",
          temperature_from: -5,
          temperature_to: 10
        },
      ]

      right_clothes = []

      clothes_collection.clothes.each do |clothing|
        clothes.each do |needed_clothing|
          if clothing.name == needed_clothing[:name] &&
            clothing.type == needed_clothing[:type] &&
            clothing.temperature_from == needed_clothing[:temperature_from] &&
            clothing.temperature_to == needed_clothing[:temperature_to]
            right_clothes << clothing
          end
        end
      end

      expect(right_clothes.size).to eq clothes.size
    end
  end

  context '#types' do
    it 'return 3 clothes types' do
      clothes_collection = ClothesCollection.new(dir_path)

      expect(clothes_collection.types.size).to eq 3
    end

    it 'return 3 right clothes types' do
      clothes_collection = ClothesCollection.new(dir_path)
      types = clothes_collection.types

      expect(types.include?('Головной убор')).to be_truthy
      expect(types.include?('Обувь')).to be_truthy
      expect(types.include?('Куртка')).to be_truthy
    end
  end

  context '#clothes_by_type' do
    it 'return right clothing by type' do
      clothes_collection = ClothesCollection.new(dir_path)
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