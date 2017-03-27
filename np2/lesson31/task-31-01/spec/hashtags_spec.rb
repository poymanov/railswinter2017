require 'rspec'

require_relative "../lib/hashtags"

describe 'Hashtags method' do
  it 'should do return one hashtag' do
    string = "String with #one hastag"
    expect(hashtags(string)).to eq "#one"
  end

  it 'should do return two hashtags' do
    string = "String with #one hastag and another #hashtag"
    expect(hashtags(string)).to eq "#one, #hashtag"
  end

  it 'should do return hashtag with cyrillic letters' do
    string = "String with #русским russian hashtag"
    expect(hashtags(string)).to eq "#русским"
  end

  it 'should do return hashtag with underscore symbol' do
    string = "Another string to test hashtags with #under_score"
    expect(hashtags(string)).to eq "#under_score"
  end

  it 'should do return hashtag with minus symbol' do
    string = "Now we testing hashtag with #minus-symbol"
    expect(hashtags(string)).to eq "#minus-symbol"
  end

  it 'should do return hashtag without question symbol' do
    string = "How are #you?"
    expect(hashtags(string)).to eq "#you"
  end

  it 'should do return hashtag without exclamation symbol' do
    string = "Attention! #alert!"
    expect(hashtags(string)).to eq "#alert"
  end
end