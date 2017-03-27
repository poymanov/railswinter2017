require 'rspec'
require_relative '../lib/clothing'

describe 'Clothing Class' do
  current_path = File.dirname(__FILE__)

  context '#initialize' do
    it 'returns right data' do
      file_path = current_path + '/fixtures/clothes/01.txt'
      clothing = Clothing.new(file_path)

      expect(clothing.name).to eq "Шапка-ушанка"
      expect(clothing.type).to eq "Головной убор"
      expect(clothing.temperature_from).to eq -20
      expect(clothing.temperature_to).to eq -5
    end
  end

  context '#available_for_temperature?' do
    it 'available for temperature' do
      file_path = current_path + '/fixtures/clothes/01.txt'
      clothing = Clothing.new(file_path)

      expect(clothing.available_for_temperature?(-15)).to be_truthy
    end

    it 'not available for temperature' do
      file_path = current_path + '/fixtures/clothes/01.txt'
      clothing = Clothing.new(file_path)

      expect(clothing.available_for_temperature?(15)).to be_falsey
    end
  end

  context '#info' do
    it 'return right info for clothing' do
      file_path = current_path + '/fixtures/clothes/01.txt'
      clothing = Clothing.new(file_path)

      expect(clothing.info).to eq "Шапка-ушанка, Головной убор, -20..-5"
    end
  end
end