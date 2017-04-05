require 'clothing'

describe Clothing do
  let(:clothing) do
    current_path = File.dirname(__FILE__)
    file_path = current_path + '/fixtures/clothes/01.txt'
    clothing = Clothing.new(file_path)
  end

  context '#initialize' do
    it 'create clothing instance from file' do
      expect(clothing.name).to eq "Шапка-ушанка"
      expect(clothing.type).to eq "Головной убор"
      expect(clothing.temperature_from).to eq -20
      expect(clothing.temperature_to).to eq -5
    end
  end

  context '#available_for_temperature?' do
    it 'returns true if clothing available for temperature' do
      expect(clothing.available_for_temperature?(-15)).to be_truthy
    end

    it 'returns false if clothing available for temperature' do
      expect(clothing.available_for_temperature?(15)).to be_falsey
    end
  end

  context '#info' do
    it 'returns clothings info' do
      expect(clothing.info).to eq "Шапка-ушанка, Головной убор, -20..-5"
    end
  end
end