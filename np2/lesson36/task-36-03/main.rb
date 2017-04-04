# encoding: utf-8

require 'uri'
require 'net/http'
require 'rexml/document'

uri = URI.parse('http://www.cbr.ru/scripts/XML_daily.asp')

response = Net::HTTP.get_response(uri)

doc = REXML::Document.new(response.body)

doc.root.elements.each do |currency|
  currency_code = currency.elements['NumCode'].text.to_i

  unless currency_code == 840 || currency_code == 978
    next
  end

  puts "#{currency.elements['Name'].text}: #{currency.elements['Value'].text} руб."
end


