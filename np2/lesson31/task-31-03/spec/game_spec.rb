require 'rspec'
require_relative '../game'

describe 'Viselitsa game' do
  it 'player must win' do
    game = Game.new('хипстер')

    variants_letters = ['о', 'п', 'а', 'х', 'р', 'с', 'т', 'и', 'е']

    variants_letters.each do |letter|
      game.next_step(letter)
    end

    expect(game.status).to eq 1
  end

  it 'player must lose' do
    game = Game.new('ворон')

    variants_letters = ['о', 'п', 'а', 'х', 'р', 'с', 'т', 'и', 'е']

    variants_letters.each do |letter|
      game.next_step(letter)
    end

    expect(game.status).to eq -1
  end

end